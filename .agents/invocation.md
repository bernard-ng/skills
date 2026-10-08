# Model-invoked vs user-invoked

Every `SKILL.md` in this repo is either model-invoked or user-invoked. The axis is who can reach it.

- **Model-invoked** (the default and the rule for the `research/` and `engineering/` buckets): the agent or the user can reach it. Omit `disable-model-invocation` from the frontmatter and the `policy` block from `agents/openai.yaml`. The `description` is **model-facing**: it carries rich trigger phrasing ("Use when...", the user phrases that should fire it, and the implicit situations where it should fire without being asked). Auto-invocation depends on this text.
- **User-invoked**: reachable only when the human types its name. Set `disable-model-invocation: true` in the frontmatter and `policy.allow_implicit_invocation: false` in `agents/openai.yaml`, and keep both in sync. The `description` becomes a short human-facing summary with no trigger list.

The test for staying model-invoked: could the model usefully reach for this skill on its own? Every research-writing and engineering skill passes, because each reacts to a visible request or artifact signal (for example a research gap, a bare number, a god object, or an unclear handoff). So none of them is user-invoked.

## Writing a model-facing description

- Start with "Use when", then name the situations: the document part, the user phrasing in quotes, and the textual signals that should fire it without a request.
- End with an automatic-apply clause: "Apply automatically when...".
- One line. No colon followed by a space (it breaks strict YAML). At most 1024 characters.

## Dependencies between skills

An operative dependency is an instruction to **call the Skill tool** with the named skill ("Call the Skill tool with `tense-selection`"), not a deep relative link and not a bare slash-name left for the model to interpret. Naming the tool is what makes the harness load the skill. The Skill tool takes one skill per call, so a step needing two skills is two calls.

Router prose that only names skills for a reader to choose from keeps plain markdown links. Each bucket has a router (`science-research-writing`, or `responsibility-driven-design` and `domain-driven-design` for engineering) that maps its flows; keep the appropriate router in sync whenever a skill is added, renamed, or removed.

Phrase banks live in the `references/` folder of the section skill that owns them. Other skills link to them, so the `research/` category must be installed as a whole.

## openai.yaml

Every skill carries `agents/openai.yaml` with `interface.display_name` and `interface.short_description` for harnesses that read it.
