# Agent guidance

This repository holds reusable agent skills, in buckets under `skills/`: `research/` today, `engineering/` reserved. Each skill lives in `skills/<bucket>/<name>/SKILL.md` with YAML `name` and `description`. Use lowercase hyphenated names. Keep a skill focused on one distinct writing decision or deliverable, and put substantial conditional material (phrase banks, tables) in its `references/` folder, linked from `SKILL.md`.

## Invocation

Every research skill is **model-invoked**: the `description` is model-facing, starts with "Use when", names the situations, user phrasings, and text signals that should fire it, and ends with an automatic-apply clause. One line, at most 1024 characters, no colon followed by a space. See [.agents/invocation.md](.agents/invocation.md). Operative dependencies between skills say "call the Skill tool with `<name>`"; the `science-research-writing` router owns the flows and the signal table.

## Required for every skill

- `agents/openai.yaml` beside `SKILL.md` (display name and short description).
- An entry in `.claude-plugin/plugin.json`'s `skills` array.
- A changeset (`npm run changeset`) for any user-visible change. Never edit `version` fields or `CHANGELOG.md` by hand. See [.agents/releasing.md](.agents/releasing.md).
- A line in the bucket catalog (`skills/research/README.md`).
- A docs page at `docs/research/<name>.md`, written to [.agents/writing-docs.md](.agents/writing-docs.md). Renames move the page; removed skills keep an archived page.
- An update to the router `skills/research/science-research-writing/SKILL.md` (flows, tables) when a skill is added, renamed, or removed.

## Content rules

For research-writing changes, never add invented scientific data, citations, or quotations. Examples are original and illustrative, and must say so where they could be mistaken for facts. Keep the safeguards: verify before asserting, preserve the author's meaning, calibrate certainty. Scope is in [SCOPE.md](SCOPE.md); declined ideas are in [.out-of-scope/](.out-of-scope/).

Install commands are copied verbatim from [.agents/install-block.md](.agents/install-block.md).

## Before finishing

Run `scripts/validate-skills.sh`. It checks frontmatter, descriptions, links, the catalog, the plugin manifest, `openai.yaml`, and docs pages.
