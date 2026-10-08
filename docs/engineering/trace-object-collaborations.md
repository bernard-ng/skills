## What it does

Simulates a concrete scenario as requests among roles to find missing objects, vague duties, and unexplained handoffs before code exists.

It asks where each reference came from and what information each object needed.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a use case crosses several objects or before coding a design that was never walked through. To record the result, use [describe-object-collaborations](./describe-object-collaborations.md).

## Common questions

**How long should a simulation take?**
About an hour at most. Longer usually means the scope is too big.

## It's working if

- The trace reaches its outcome and every request names a real duty.

## Where it fits

Chain step 4. Pairs with [design-object-connections](./design-object-connections.md). Map: [router](./responsibility-driven-design.md).
