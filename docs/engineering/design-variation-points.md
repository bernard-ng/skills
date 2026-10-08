## What it does

Justifies flexibility with concrete variations, picks the simplest mechanism that supports them, and writes a recipe for adding a variant.

It asks for at least three tangible examples before inventing a flexible solution.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when requirements mention future variants, config flags multiply, or an abstraction is justified as flexible.

## Common questions

**Can I add a hook now and use it later?**
Only with evidence of the direction of change. Unused hooks add complexity.

## It's working if

- The design says what varies, who changes it and when, what the mechanism costs, and how a variant is verified.

## Where it fits

Chain step 7. Reviewed by [review-object-design](./review-object-design.md). Map: [router](./responsibility-driven-design.md).
