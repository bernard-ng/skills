## What it does

Classifies concepts by what they mean to the business, sets identity and equality for entities, makes values small and immutable, keeps services few and stateless, and reduces associations.

Stops identity, mutability, and behavior from landing in the wrong place.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when introducing or reviewing a domain class, an "entity or value object" question, or when logic sits in services over passive data.

## Common questions

**Does every class need an ID?**
No. Only concepts the business tracks individually over time.

**When is a service right?**
When an operation is a real business activity that belongs to no single object. It is not a place to park logic.

## It's working if

- Entities have explicit identity; values are immutable and validate themselves.
- Associations have a direction and a purpose.

## Where it fits

Follows [build-ubiquitous-language](./build-ubiquitous-language.md) and leads to [design-aggregates](./design-aggregates.md). Pairs with [assign-object-responsibilities](./assign-object-responsibilities.md). Router: [domain-driven-design](./domain-driven-design.md).
