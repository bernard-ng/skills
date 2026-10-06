# Skills

Focused agent skills, one folder per skill, each with a `SKILL.md` entry point. The `research/` bucket is a complete pack for **English scientific research writing**: section models, language precision, evidence and attribution checks, and manuscript review.

The skills are **model-invoked**. Each description lists the requests and text signals that should fire it, so the agent applies them on its own: ask for "write up my results" or "fix my English" and the right ones load. Start from the router, [science-research-writing](skills/research/science-research-writing/SKILL.md), or read the [research catalog](skills/research/README.md) and the [docs pages](docs/research/science-research-writing.md).

## Install

Pick one route. Installing both leaves every skill twice.

**Claude Code plugin.** Ships every skill in `skills/research/`, so cross-links and phrase banks keep working.

```bash
claude plugin marketplace add bernard-ng/skills
claude plugin install science-research-writing-skills@bernard-ng
```

**skills.sh, for Codex and other agents.** [skills.sh](https://skills.sh) copies editable skill files into your project.

```bash
npx skills@latest add bernard-ng/skills
```

The installer lets you choose skills and target agents. Select the whole `research/` set, or at least `science-research-writing` (the router) plus the section skills you need, because skills link to each other and to their phrase banks. To install or update a single skill:

```bash
npx skills@latest add bernard-ng/skills --skill=write-results
```

```bash
npx skills@latest update write-results
```

**Manual copy.** Copy the whole `skills/research/` folder into your agent's skills directory.

To symlink every skill into the local harness directories while developing, run `scripts/link-skills.sh`.

## The main flow

1. `target-article-analysis`, if the journal's conventions are unknown.
2. Draft in this order: `write-methodology`, `write-results`, `write-introduction`, `write-discussion-conclusion`, `write-abstract`, `write-title`.
3. `scientific-style-editing`, then `paper-consistency-audit` for a full manuscript.

Along the way, the language and evidence skills fire on their own signals, for example `tense-selection` on a tense shift, `causal-language` on "caused", `limitations-future-work` on a hidden problem.

## Organization

- `skills/research/`: the writing and review skills, with a catalog `README.md`.
- `skills/engineering/`: reserved for future engineering skills.
- `docs/research/`: one human-facing page per skill (what it does, when it fires, common questions, how to tell it is working).
- `.claude-plugin/`: plugin and marketplace manifests.
- `.agents/`: repository conventions (invocation model, docs-page template, decision records).
- `scripts/`: validation, plugin version sync, and linking tools.
- `.changeset/`, `.github/workflows/`: release automation and CI. See [.agents/releasing.md](.agents/releasing.md).
- [SCOPE.md](SCOPE.md), [GLOSSARY.md](GLOSSARY.md), [CHANGELOG.md](CHANGELOG.md), [.out-of-scope/](.out-of-scope/).

The layout (buckets, per-skill `agents/openai.yaml`, a router skill, a plugin manifest, docs pages) follows [mattpocock/skills](https://github.com/mattpocock/skills). No skill text is copied from it.

## Use with care

These files are writing procedures, not a source of scientific facts. Supply the actual study details, data, references, and journal requirements.
