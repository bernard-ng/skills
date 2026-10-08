## What it does

Decides whether a structure is needed, starts loose, chooses among metaphor, responsibility layers, knowledge level, and pluggable components, and keeps it evolving and in the shared language.

Lets independent work stay consistent without freezing design decisions up front.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when modules multiply, nobody knows where new code belongs, or each area solves the same problem differently.

## Common questions

**Do I always need one?**
No. Modules plus a clear core are enough for many systems. A structure that does not fit is worse than none.

**How is this different from layered architecture?**
Responsibility layers organize domain concepts by business role. Technical layers are in [place-objects-in-layers](./place-objects-in-layers.md).

## It's working if

- A new person can predict where a feature belongs.
- Exceptions are few and marked.

## Where it fits

Works with [map-bounded-contexts](./map-bounded-contexts.md) and [distill-core-domain](./distill-core-domain.md); related technical view in [place-objects-in-layers](./place-objects-in-layers.md). Router: [domain-driven-design](./domain-driven-design.md).
