# Releasing

Releases use [changesets](https://github.com/changesets/changesets). `package.json` (private) holds the version; `scripts/sync-plugin-version.mjs` copies it into `.claude-plugin/plugin.json` so the plugin and the changelog never drift. Never edit either `version` field or `CHANGELOG.md` by hand.

## When a change needs a changeset

Add one for any change users would notice: a new, renamed, or removed skill, or a behaviour change in an existing one. Skip it for typos, internal docs, and scripts.

```bash
npm run changeset
```

Choose the bump (the package is `science-research-writing-skills`), then write one or two sentences for the changelog: what the skill now does differently and why it matters to the user. Commit the generated `.changeset/<name>.md` with the change.

- **patch:** wording fixes and clarifications that change how a skill behaves a little.
- **minor:** a new skill, or a new capability in an existing one.
- **major:** a removed or renamed skill, or a change that breaks the router's flows.

## What CI does

1. `Validate` (`.github/workflows/validate.yml`) runs `scripts/validate-skills.sh` on every pull request and push to `main`. It also fails if `plugin.json` and `package.json` versions differ.
2. `Release` (`.github/workflows/release.yml`) runs on every push to `main`. When changesets are pending it opens or updates a "chore: version skills" pull request that runs `npm run version` (bump `package.json`, write `CHANGELOG.md`, sync `plugin.json`). Merging that pull request tags the release with `npx changeset tag`.

## Checks before merging a version pull request

Run `bash scripts/validate-skills.sh` and `npm run check-plugin-version`. After merging, plugin users receive the new version; skills.sh users receive it with `npx skills@latest update`.
