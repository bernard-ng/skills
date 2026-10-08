## What it does

Assigns detection, recovery, ownership, and contracts for failures across collaborators, scaled to what a failure costs.

It separates exceptions worth designing for from errors that should simply fail visibly, and it does not treat logging as handling.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when requests cross trust or system boundaries, workflows retry or time out, or exceptions have no clear handler.

## Common questions

**Should every object validate its inputs?**
No. Validate where information enters a trust region; redundant checks inside add cost and false confidence. Never waive required authorization.

## It's working if

- Every handled failure has an owner and a resulting state, and clients can tell success, recoverable failure, and terminal failure apart.

## Where it fits

Chain step 7. Traced with [trace-object-collaborations](./trace-object-collaborations.md). Map: [router](./responsibility-driven-design.md).
