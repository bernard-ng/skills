# 0002: Promote a focused engineering bucket

Status: the single-plugin decision below is superseded by [0003](0003-one-plugin-per-bucket.md).

## Context

The repository now includes responsibility-driven object design skills in `skills/engineering/`. ADR 0001 limited the plugin to research skills because no other bucket existed then.

## Decision

- Promote `engineering/` alongside `research/`. Both buckets appear in `.claude-plugin/plugin.json`, have catalogs and docs pages, and are checked by `scripts/validate-skills.sh`.
- Keep the existing plugin and package name, `science-research-writing-skills`, so current installation commands continue to work. Broaden their descriptions to cover both buckets.
- Give each bucket its own router. Engineering starts at `responsibility-driven-design`; research remains at `science-research-writing`.

## Consequences

The plugin installs both categories. Skills.sh users may choose a category or individual skills, with its router when needed. The research-only manifest rule in ADR 0001 is superseded by this decision.
