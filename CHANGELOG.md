# bernard-ng-skills

## 0.1.2

### Patch Changes

- Ship research and engineering skills as two Claude Code plugins, `science-research-writing-skills` and `software-design-skills`, so the skills.sh picker groups skills by bucket instead of listing engineering skills under the research heading.

## 0.1.1

### Patch Changes

- e5638db: Add 16 responsibility-driven object design skills: a router plus skills for framing a design problem, discovering and naming roles, defining shared roles, assigning responsibilities, tracing collaborations, designing object connections, choosing control style, placing objects in layers, applying patterns with judgment, reliable collaborations, variation points, design review, describing collaborations, and solving revealing design problems.
- Add 10 domain-driven design skills to the engineering bucket: a router plus skills for building a ubiquitous language, modeling entities, values, and services, designing aggregates with factories and repositories, making implicit rules explicit, shaping supple design, refactoring toward deeper insight, mapping bounded contexts, distilling the core domain, and evolving a large-scale structure.

## 0.1.0

### Minor Changes

- Reviewed every research skill and rewrote descriptions as model-facing trigger text, so the agent applies them automatically.
- Added `target-article-analysis`, `limitations-future-work`, `contribution-mapping`, `evaluative-language`, `noun-phrases-prepositions`, `scientific-conventions`, and `spatial-description`.
- Expanded the section skills with top-down overviews, justification and care in Methods, interpretation in Results, mapping and bounded novelty in the Discussion, and abstract components and tense.
- Added strength scales and tables to the language skills: tense by section, voice cases, modal functions, causal verb strength, sequence, frequency, and quantity wording.
- Added phrase banks under `references/` for the Introduction, Methods, Results, Discussion, and Abstract.
- Added the Claude Code plugin manifests, `agents/openai.yaml` per skill, `docs/research/` pages, repository conventions under `.agents/`, and flows plus Skill-tool instructions in the router.
- Documented skills.sh installation (`npx skills@latest add`) alongside the Claude Code plugin.
- Added changesets-based releases, a validation script, and CI workflows.
- Removed external-source attributions from the skills and documentation.
