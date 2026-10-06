#!/usr/bin/env bash
# Symlink every skill into the local harness skill directories, so a git pull keeps them current.
# Re-run after adding, removing, or renaming a skill.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
targets=("$HOME/.claude/skills" "$HOME/.agents/skills")
for dir in "${targets[@]}"; do
  mkdir -p "$dir"
  for f in "$root"/skills/*/*/SKILL.md; do
    name="$(basename "$(dirname "$f")")"
    ln -sfn "$(dirname "$f")" "$dir/$name"
  done
done
echo "Linked skills into: ${targets[*]}"
