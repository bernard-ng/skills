#!/usr/bin/env bash
#
# Validate the skill library. Run locally or in CI (.github/workflows/validate.yml).
#
# Checks, per skill:   frontmatter, name, description rules, agents/openai.yaml, docs page.
# Checks, repo-wide:   markdown links, bucket catalogs, plugin manifest coverage, version sync.
#
# Every problem is reported before the script exits, so one run shows the whole list.
# Exit status: 0 when clean, 1 when any check failed.
#
# Requires bash 3.2+ (works on macOS and Linux), jq, awk, grep, sed.

set -uo pipefail   # no `-e`: a failed check must not stop the remaining checks

# ---------------------------------------------------------------------------
# Declarations
# ---------------------------------------------------------------------------

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SKILLS_DIR="$ROOT/skills"
DOCS_DIR="$ROOT/docs"
PLUGIN_JSON="$ROOT/.claude-plugin/plugin.json"
MARKETPLACE_JSON="$ROOT/.claude-plugin/marketplace.json"
PACKAGE_JSON="$ROOT/package.json"

# Buckets whose skills ship in the Claude Code plugin. Other buckets must not appear in it.
PROMOTED_BUCKETS="research"

# Top-level markdown files whose links are checked, in addition to skills, docs, and catalogs.
TOP_LEVEL_DOCS="README.md AGENTS.md SCOPE.md GLOSSARY.md CHANGELOG.md"

# A description is one YAML line read by the model, so it is bounded and must parse strictly.
MAX_DESCRIPTION_LENGTH=1024

ERRORS=0

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

# fail MESSAGE...  Record a problem and keep going.
fail() {
  echo "ERROR: $*" >&2
  ERRORS=$((ERRORS + 1))
}

# rel PATH  Print PATH relative to the repo root, for readable messages.
rel() {
  echo "${1#"$ROOT"/}"
}

# frontmatter FILE  Print the lines between the opening and closing `---` of FILE.
# Prints nothing when the file does not start with a frontmatter block.
frontmatter() {
  awk '
    NR == 1 && $0 != "---" { exit }
    NR == 1               { next }
    $0 == "---"           { closed = 1; exit }
    { print }
    END { if (!closed) exit 1 }
  ' "$1"
}

# frontmatter_field FILE KEY  Print the value of a single-line `KEY: value` field.
frontmatter_field() {
  frontmatter "$1" | sed -n "s/^$2:[[:space:]]*//p" | head -n 1
}

# skill_files  Print the path of every SKILL.md, sorted.
skill_files() {
  find "$SKILLS_DIR" -mindepth 3 -maxdepth 3 -name SKILL.md | sort
}

# ---------------------------------------------------------------------------
# Per-skill checks
# ---------------------------------------------------------------------------

# check_skill FILE  Validate one SKILL.md and the files that must sit beside it.
check_skill() {
  local file="$1"
  local dir bucket folder name desc

  dir="$(dirname "$file")"
  folder="$(basename "$dir")"
  bucket="$(basename "$(dirname "$dir")")"

  if ! frontmatter "$file" >/dev/null; then
    fail "$(rel "$file"): missing YAML frontmatter"
    return
  fi

  # name: lowercase hyphenated, and identical to the folder name.
  name="$(frontmatter_field "$file" name)"
  if [[ "$name" != "$folder" ]] || [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    fail "$(rel "$file"): invalid or mismatched name '$name'"
  fi

  # description: model-facing trigger text, with rules that keep it parseable and effective.
  desc="$(frontmatter_field "$file" description)"
  if [[ -z "$desc" ]]; then
    fail "$(rel "$file"): missing description"
  else
    if ((${#desc} > MAX_DESCRIPTION_LENGTH)); then
      fail "$(rel "$file"): description is ${#desc} characters, over $MAX_DESCRIPTION_LENGTH"
    fi
    if [[ "$desc" == *": "* || "$desc" == *" #"* ]]; then
      fail "$(rel "$file"): description contains ': ' or ' #', which breaks strict YAML"
    fi
    if [[ "$desc" != "Use when"* && "$desc" != "Use for"* ]]; then
      fail "$(rel "$file"): description must start with 'Use when' or 'Use for'"
    fi
    # The router says "Start here"; every other skill ends with an automatic-apply clause.
    if [[ "$desc" != *"automatically"* && "$desc" != *"Start here"* ]]; then
      fail "$(rel "$file"): description lacks an automatic-apply clause"
    fi
  fi

  [[ -f "$dir/agents/openai.yaml" ]] || fail "$(rel "$file"): missing agents/openai.yaml"
  [[ -f "$DOCS_DIR/$bucket/$folder.md" ]] || fail "$(rel "$file"): missing docs page docs/$bucket/$folder.md"
}

# check_unique_names  Skill names must be unique across all buckets.
check_unique_names() {
  local duplicates
  duplicates="$(skill_files | while read -r f; do basename "$(dirname "$f")"; done | sort | uniq -d)"
  [[ -z "$duplicates" ]] || fail "duplicate skill names: $(echo "$duplicates" | tr '\n' ' ')"
}

# ---------------------------------------------------------------------------
# Repo-wide checks
# ---------------------------------------------------------------------------

# check_links FILE  Every relative markdown link in FILE must resolve to an existing path.
# Loops read from process substitution (`< <(...)`), not a pipe, so `fail` runs in this shell
# and its error count survives.
check_links() {
  local file="$1"
  local target

  # Extract the target of each [text](target); skip external, anchor-only, and mailto links.
  while read -r target; do
    case "$target" in
      http://* | https://* | mailto:* | '#'* | '<'* | '') continue ;;
    esac
    target="${target%%#*}"   # drop any #anchor
    [[ -z "$target" || -e "$(dirname "$file")/$target" ]] || fail "$(rel "$file"): broken link $target"
  done < <(grep -o '\[[^]]*\]([^)]*)' "$file" 2>/dev/null | sed 's/^[^(]*(//; s/)$//')
}

# check_all_links  Run the link check over every markdown file a reader can land on.
check_all_links() {
  local file name
  while read -r file; do
    check_links "$file"
  done < <(
    for name in $TOP_LEVEL_DOCS; do [[ -f "$ROOT/$name" ]] && echo "$ROOT/$name"; done
    find "$SKILLS_DIR" -name '*.md'
    find "$DOCS_DIR" -name '*.md'
  )
}

# check_catalogs  Each bucket README must link every skill in that bucket.
check_catalogs() {
  local file dir bucket folder catalog
  while read -r file; do
    dir="$(dirname "$file")"
    folder="$(basename "$dir")"
    bucket="$(dirname "$dir")"
    catalog="$bucket/README.md"
    if [[ ! -f "$catalog" ]]; then
      fail "$(rel "$bucket"): missing README.md catalog"
    elif ! grep -qF "($folder/SKILL.md)" "$catalog"; then
      fail "$(rel "$file"): missing from $(rel "$catalog")"
    fi
  done < <(skill_files)
}

# check_plugin  plugin.json must list exactly the skills in the promoted buckets.
check_plugin() {
  local expected listed bucket dir s

  if [[ ! -f "$PLUGIN_JSON" ]]; then
    fail ".claude-plugin/plugin.json: missing"
    return
  fi
  if ! jq empty "$PLUGIN_JSON" 2>/dev/null; then
    fail ".claude-plugin/plugin.json: invalid JSON"
    return
  fi
  jq empty "$MARKETPLACE_JSON" 2>/dev/null || fail ".claude-plugin/marketplace.json: missing or invalid JSON"

  expected="$(
    for bucket in $PROMOTED_BUCKETS; do
      for dir in "$SKILLS_DIR/$bucket"/*/; do
        [[ -f "${dir}SKILL.md" ]] && echo "./skills/$bucket/$(basename "$dir")"
      done
    done | sort
  )"
  listed="$(jq -r '.skills[]' "$PLUGIN_JSON" | sort)"

  # Lines only in `expected` are missing from the manifest; lines only in `listed` are extra.
  while read -r s; do
    [[ -z "$s" ]] || fail ".claude-plugin/plugin.json: missing $s"
  done < <(comm -23 <(echo "$expected") <(echo "$listed"))
  while read -r s; do
    [[ -z "$s" ]] || fail ".claude-plugin/plugin.json: lists unknown or non-promoted $s"
  done < <(comm -13 <(echo "$expected") <(echo "$listed"))
}

# check_versions  plugin.json must carry the version that changesets wrote to package.json.
check_versions() {
  local package_version plugin_version
  package_version="$(jq -r '.version' "$PACKAGE_JSON" 2>/dev/null)"
  plugin_version="$(jq -r '.version' "$PLUGIN_JSON" 2>/dev/null)"
  if [[ "$package_version" != "$plugin_version" ]]; then
    fail "plugin.json version '$plugin_version' differs from package.json '$package_version' (run: node scripts/sync-plugin-version.mjs)"
  fi
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

main() {
  command -v jq >/dev/null || { echo "ERROR: jq is required" >&2; exit 2; }

  local count=0 file
  while read -r file; do
    check_skill "$file"
    count=$((count + 1))
  done < <(skill_files)

  check_unique_names
  check_all_links
  check_catalogs
  check_plugin
  check_versions

  if ((ERRORS > 0)); then
    echo "$ERRORS problem(s) found." >&2
    exit 1
  fi
  echo "Validated $count skills: frontmatter, descriptions, openai.yaml, docs pages, catalogs, plugin manifest, version sync, and local links."
}

main "$@"
