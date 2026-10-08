## What it does

Chooses what to show, at which level, and in which form to explain how objects cooperate, and tells the story with a single point of view.

It shows only what is known and keeps happy paths separate from exceptions.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when writing a design doc, README, ADR, or PR description, or when asked for a diagram.

## Common questions

**Should I generate diagrams from code?**
They show the code, not the design. Draw what helps a reader decide or understand.

## It's working if

- A reader can state the scenario, who takes part, who decides, and where the design is uncertain.

## Where it fits

Chain step 8. Uses output from [trace-object-collaborations](./trace-object-collaborations.md). Map: [router](./responsibility-driven-design.md).
