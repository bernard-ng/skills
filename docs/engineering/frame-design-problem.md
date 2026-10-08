## What it does

Turns a vague design task into a short design story, a few themes, a boundary, constraints, and a ranked list of open questions, and says which parts are core.

It designs no objects. It decides what the problem is first, because use cases rarely mention control, errors, timing, or scale.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this at the start of any non-trivial design, or when requirements are vague or conflicting. Once the brief exists, move to [discover-object-roles](./discover-object-roles.md).

## Common questions

**Why write a story when I have requirements?**
A story in your own words shows what you think matters and pulls the use cases, architecture, and stakeholders into one view.

**What if I cannot answer the open questions yet?**
Rank them by impact and continue with explicit assumptions.

## It's working if

- Someone else can read the brief and say what is risky and what is unknown.
- The core problems are named.

## Where it fits

Chain step 1. Feeds role discovery. Map: [router](./responsibility-driven-design.md).
