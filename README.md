# Skills

Focused agent skills, one folder per skill, each with a `SKILL.md` entry point. The `research/` bucket covers English scientific research writing. The `engineering/` bucket covers responsibility-driven object design: framing a problem, finding roles, assigning duties, tracing collaborations, control, reliability, flexibility, and design review.

The skills are **model-invoked**. Each description lists the requests and text signals that should fire it, so the agent applies them on its own: ask for "write up my results" or "where should this decision live?" and the relevant skill can load. Start from the relevant router: [science-research-writing](skills/research/science-research-writing/SKILL.md) or [responsibility-driven-design](skills/engineering/responsibility-driven-design/SKILL.md). Browse the [research catalog](skills/research/README.md) or [engineering catalog](skills/engineering/README.md).

## Install

Pick one route. Installing both leaves every skill twice.

**Claude Code plugin.** Ships every promoted skill in `skills/research/` and `skills/engineering/`, so cross-links and references keep working.

```bash
claude plugin marketplace add bernard-ng/skills
claude plugin install science-research-writing-skills@bernard-ng
```

**skills.sh, for Codex and other agents.** [skills.sh](https://skills.sh) copies editable skill files into your project.

```bash
npx skills@latest add bernard-ng/skills
```

The installer lets you choose skills and target agents. Select the whole category or include its router (`science-research-writing` or `responsibility-driven-design`) with the focused skills you need. Research skills link to phrase banks in their category. To install or update a single skill:

```bash
npx skills@latest add bernard-ng/skills --skill=write-results
```

```bash
npx skills@latest update write-results
```

**Manual copy.** Copy the category you need from `skills/` into your agent's skills directory.

To symlink every skill into the local harness directories while developing, run `scripts/link-skills.sh`.

## Research writing flow

1. `target-article-analysis`, if the journal's conventions are unknown.
2. Draft in this order: `write-methodology`, `write-results`, `write-introduction`, `write-discussion-conclusion`, `write-abstract`, `write-title`.
3. `scientific-style-editing`, then `paper-consistency-audit` for a full manuscript.

Along the way, the language and evidence skills fire on their own signals, for example `tense-selection` on a tense shift, `causal-language` on "caused", `limitations-future-work` on a hidden problem.

## Object design flow

1. [frame-design-problem](skills/engineering/frame-design-problem/SKILL.md), if the problem is vague.
2. [discover-object-roles](skills/engineering/discover-object-roles/SKILL.md) (with [name-design-objects](skills/engineering/name-design-objects/SKILL.md) and [define-shared-roles](skills/engineering/define-shared-roles/SKILL.md)), then [assign-object-responsibilities](skills/engineering/assign-object-responsibilities/SKILL.md).
3. [trace-object-collaborations](skills/engineering/trace-object-collaborations/SKILL.md), [design-object-connections](skills/engineering/design-object-connections/SKILL.md), [choose-control-style](skills/engineering/choose-control-style/SKILL.md), [place-objects-in-layers](skills/engineering/place-objects-in-layers/SKILL.md), and [apply-design-patterns](skills/engineering/apply-design-patterns/SKILL.md) as the design needs them.
4. [design-reliable-collaborations](skills/engineering/design-reliable-collaborations/SKILL.md) and [design-variation-points](skills/engineering/design-variation-points/SKILL.md) when failure or change is a real concern.
5. [review-object-design](skills/engineering/review-object-design/SKILL.md) and [describe-object-collaborations](skills/engineering/describe-object-collaborations/SKILL.md) to check and communicate, and [solve-revealing-design-problems](skills/engineering/solve-revealing-design-problems/SKILL.md) when a part resists solution.

The router, [responsibility-driven-design](skills/engineering/responsibility-driven-design/SKILL.md), holds the flow and the signals that fire each skill. For a small change, only the matching specialist runs.

## Organization

- `skills/research/`: the writing and review skills, with a catalog `README.md`.
- `skills/engineering/`: responsibility-driven object design skills, with a catalog `README.md`.
- `docs/research/` and `docs/engineering/`: one human-facing page per skill.
- `.claude-plugin/`: plugin and marketplace manifests.
- `.agents/`: repository conventions (invocation model, docs-page template, decision records).
- `scripts/`: validation, plugin version sync, and linking tools.
- `.changeset/`, `.github/workflows/`: release automation and CI. See [.agents/releasing.md](.agents/releasing.md).
- [SCOPE.md](SCOPE.md), [GLOSSARY.md](GLOSSARY.md), [CHANGELOG.md](CHANGELOG.md), [.out-of-scope/](.out-of-scope/).

The layout (buckets, per-skill `agents/openai.yaml`, category routers, a plugin manifest, docs pages) follows [mattpocock/skills](https://github.com/mattpocock/skills). No skill text is copied from it.

## Use with care

Research skills are writing procedures, not a source of scientific facts. Engineering skills are design procedures, not a substitute for the current code, requirements, or implementation constraints.
