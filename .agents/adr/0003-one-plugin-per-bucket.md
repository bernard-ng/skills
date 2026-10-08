# 0003: One plugin per bucket

## Context

ADR 0002 shipped both buckets in one plugin named `science-research-writing-skills`. The skills.sh installer groups skills by plugin name, so engineering skills appeared under the heading "Science Research Writing Skills" in its picker. A plugin manifest at the repository root also overrides the marketplace grouping.

## Decision

- Ship one Claude Code plugin per bucket, declared only in `.claude-plugin/marketplace.json` with `strict: false` and an explicit `skills` list: `science-research-writing-skills` for `research/` and `software-design-skills` for `engineering/`.
- Remove the root `.claude-plugin/plugin.json`. The marketplace entries are the single manifest.
- `scripts/validate-skills.sh` requires each plugin to list exactly the skills of its bucket, and every plugin version to equal `package.json`. `scripts/sync-plugin-version.mjs` writes the version into every plugin entry.
- Keep the research plugin name so existing install commands keep working.

## Consequences

Claude Code users install the plugins they need. The skills.sh picker shows one group per bucket. A new bucket needs a plugin entry and a line in `PLUGIN_FOR_<bucket>` in the validator.
