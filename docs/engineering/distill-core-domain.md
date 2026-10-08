## What it does

Finds the distinctive core, writes a one-page vision, flags or segregates the core, chooses how to source generic subdomains, extracts mechanisms, and directs people and refactoring to the core.

Stops generic work from crowding out the business heart.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when deciding where effort or the strongest developers go, or when generic code dominates a large codebase.

## Common questions

**Is everything important core?**
No. Most of a system is necessary but not distinctive. Core is the small part that differentiates.

**Should generic parts be reusable?**
Not by design. Keep them free of business specifics and build only what is needed.

## It's working if

- The core can be stated in a page and located in the code.
- Generic parts have a sourcing route and carry no business specifics.

## Where it fits

Sets priorities for [refactor-toward-deeper-insight](./refactor-toward-deeper-insight.md) and [shape-supple-design](./shape-supple-design.md). Complements [map-bounded-contexts](./map-bounded-contexts.md). Router: [domain-driven-design](./domain-driven-design.md).
