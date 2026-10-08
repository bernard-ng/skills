# Skills

Agent skills that give a coding or writing agent a repeatable procedure for decisions it would otherwise improvise: how to structure a research paper, where a piece of logic belongs, what a domain concept really is. Each skill is a small folder with a `SKILL.md` entry point, plain markdown that works with Claude Code, Codex, and other agents.

## What is inside

| Bucket | Skills | For |
| --- | --- | --- |
| [`research/`](skills/research/README.md) | 35 | Writing and reviewing English scientific papers: sections, evidence, claims, language, and consistency |
| [`engineering/`](skills/engineering/README.md) | 26 | Designing software: responsibility-driven object design (roles, duties, collaborations, control, reliability) and domain-driven design (shared language, aggregates, explicit rules, bounded contexts, core focus) |

Every bucket has a router skill that holds the flow and the signals that fire each specialist: [science-research-writing](skills/research/science-research-writing/SKILL.md), [responsibility-driven-design](skills/engineering/responsibility-driven-design/SKILL.md), and [domain-driven-design](skills/engineering/domain-driven-design/SKILL.md).

## How it works

The skills are **model-invoked**. Each description names the requests and code or text signals that should fire it, so the agent loads the right skill on its own, and you can still name one directly.

| You say, or the agent sees | Skill that can load |
| --- | --- |
| "Write up my results" | `write-results` |
| A sentence that claims "X caused Y" | `causal-language` |
| "This class does too much" | `assign-object-responsibilities` |
| The same word meaning two things in code and in the business | `build-ubiquitous-language` |
| An invariant spanning several objects | `design-aggregates` |

A small change runs one focused skill. A large or unclear task starts at a router and moves through the specialists it names. The skills guide the work; they do not replace the current code, requirements, or constraints. Start from a router, or browse the [research catalog](skills/research/README.md) and [engineering catalog](skills/engineering/README.md).

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

The installer lets you choose skills and target agents. Select the whole category or include its router (`science-research-writing`, `responsibility-driven-design`, or `domain-driven-design`) with the focused skills you need. Research skills link to phrase banks in their category. To install or update a single skill:

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

## Domain design flow

1. [build-ubiquitous-language](skills/engineering/build-ubiquitous-language/SKILL.md), when terms are fuzzy or differ between people and code.
2. [model-domain-building-blocks](skills/engineering/model-domain-building-blocks/SKILL.md), then [design-aggregates](skills/engineering/design-aggregates/SKILL.md) for boundaries, creation, and storage.
3. [make-implicit-concepts-explicit](skills/engineering/make-implicit-concepts-explicit/SKILL.md), [shape-supple-design](skills/engineering/shape-supple-design/SKILL.md), and [refactor-toward-deeper-insight](skills/engineering/refactor-toward-deeper-insight/SKILL.md) as the model strains or hides rules.
4. [map-bounded-contexts](skills/engineering/map-bounded-contexts/SKILL.md), [distill-core-domain](skills/engineering/distill-core-domain/SKILL.md), and [evolve-large-scale-structure](skills/engineering/evolve-large-scale-structure/SKILL.md) for strategy across a large or multi-team system.

The router, [domain-driven-design](skills/engineering/domain-driven-design/SKILL.md), holds the flow and the signals. The two engineering routers cooperate: domain design decides what the model is, object design decides how its parts divide work.

## Organization

- `skills/research/`: the writing and review skills, with a catalog `README.md`.
- `skills/engineering/`: responsibility-driven object design and domain-driven design skills, with a catalog `README.md`.
- `docs/research/` and `docs/engineering/`: one human-facing page per skill.
- `.claude-plugin/`: plugin and marketplace manifests.
- `.agents/`: repository conventions (invocation model, docs-page template, decision records).
- `scripts/`: validation, plugin version sync, and linking tools.
- `.changeset/`, `.github/workflows/`: release automation and CI. See [.agents/releasing.md](.agents/releasing.md).
- [SCOPE.md](SCOPE.md), [GLOSSARY.md](GLOSSARY.md), [CHANGELOG.md](CHANGELOG.md), [.out-of-scope/](.out-of-scope/).

The layout (buckets, per-skill `agents/openai.yaml`, category routers, a plugin manifest, docs pages) follows [mattpocock/skills](https://github.com/mattpocock/skills). No skill text is copied from it.

## Use with care

Research skills are writing procedures, not a source of scientific facts. Engineering skills are design procedures, not a substitute for the current code, requirements, or implementation constraints.
