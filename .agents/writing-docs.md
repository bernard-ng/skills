# Writing docs pages

Every promoted skill has a human-facing docs page at `docs/<bucket>/<skill-name>.md`. The page is not the skill and not a copy of `SKILL.md`. It orients one reader around one skill so they know what it does, when it fires, and where it sits in the system. The pages together are a distributed router; each is a node.

Create or re-sync a page whenever a skill is added, renamed, or changes behaviour. A rename moves the file. A removed skill keeps its page, opened with `> **Archived.** ...` naming the replacement.

Links are repo-relative. There is no H1: the file name is the title.

## Template

```
## What it does

One or two plain paragraphs. Lead with the skill's job, then the defining constraint: the one fact that makes it behave differently from the obvious default. Write it as a plain declarative sentence.

## When to reach for it

- **Invocation.** Model-invoked skills fire when the task fits; the user can also name them.
- **Trigger boundary.** "Reach for this when ...". Where a sibling is confusable, say "for X instead, use [sibling](./sibling.md)."

## Common questions

**Question the reader really asks?**
Answer beneath it, saying the unflattering thing where it is true.

## It's working if

- Bullets the reader can check in their own text, without opening `SKILL.md`.

## Where it fits

Role (chain step, router, cross-cutting check), the one or two neighbours with a because-clause, and a pointer to the bucket router (`science-research-writing` for research, `responsibility-driven-design` for engineering).
```

Keep the count of questions honest to the evidence. Prefer a real confusion over an invented one. Omit `Common questions` or `It's working if` rather than pad them.
