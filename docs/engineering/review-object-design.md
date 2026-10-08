## What it does

Reviews roles, duties, and collaborations with four object tests and a table of smells, and returns findings with a concrete move for each.

It separates defects from preferences and respects framework and repository conventions.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this on design or code review, refactor requests, or "is this good design?".

## Common questions

**Does it enforce the Law of Demeter?**
No. It treats it as a guideline and weighs the cost of the structure it would force.

## It's working if

- Every finding names a role or collaboration, cites evidence, and offers a move.

## Where it fits

Chain step 8. Fixes route to [assign-object-responsibilities](./assign-object-responsibilities.md) and [design-object-connections](./design-object-connections.md). Map: [router](./responsibility-driven-design.md).
