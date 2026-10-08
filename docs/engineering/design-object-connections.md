## What it does

Decides how collaborators obtain references and how long they hold them, limits reach-through and coupling, bundles chatty requests, and replaces loose primitives with small concept objects.

It treats the Law of Demeter as a guideline with a cost.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when objects chain through other objects, clients send streams of tiny requests, or many outsiders call into one neighborhood.

## Common questions

**Should I always add a facade?**
No. Add one when too many outsiders reach too many objects, and keep it from becoming a controller.

## It's working if

- Every collaboration has a known source and lifetime for its reference.

## Where it fits

Works with [trace-object-collaborations](./trace-object-collaborations.md). Map: [router](./responsibility-driven-design.md).
