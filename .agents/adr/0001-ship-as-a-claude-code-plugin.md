# 0001: Ship as a Claude Code plugin, curated to the research bucket

## Context

The skills work only if the agent reaches for them automatically, and they link to each other, so they must install together. Copying individual folders loses the cross-links and the phrase banks.

## Decision

- Ship a Claude Code plugin: `.claude-plugin/plugin.json` lists every skill in `skills/research/`, and `.claude-plugin/marketplace.json` makes the repository its own single-plugin marketplace.
- Keep a plain skills folder install as the route for other agents.
- Every skill in `skills/research/` must appear in `plugin.json`. `scripts/validate-skills.sh` enforces this.
- Skills in any other bucket (none yet) must not appear in `plugin.json`.

## Consequences

Versions are managed by changesets: `package.json` is the source of truth and `scripts/sync-plugin-version.mjs` copies it into `.claude-plugin/plugin.json`. See [releasing](../releasing.md). A skill rename touches the skill folder, `plugin.json`, the catalog, the docs page, and the router.
