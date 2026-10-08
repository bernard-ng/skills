## What it does

Compares centralized, clustered, delegated, and dispersed control for a workflow and pushes decisions toward the objects that own the facts, keeping similar workflows consistent.

It does not treat delegation as always better.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a controller or handler is large, type or state checks repeat, or decision ownership is unclear.

## Common questions

**Should a big controller always be split?**
Not if the decisions are few and simple. Split when decisions mix several meanings or contexts.

## It's working if

- Decision ownership is explicit and the next case has a clear path.

## Where it fits

Chain step 5. Uses [define-shared-roles](./define-shared-roles.md) to remove type checks. Map: [router](./responsibility-driven-design.md).
