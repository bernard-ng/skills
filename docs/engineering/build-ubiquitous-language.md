## What it does

Collects how the business actually talks, finds conflicting or missing terms, settles one meaning per term, and carries the result into class, method, and test names.

Treats a change in language as a change in the model, so code and conversation do not drift apart.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when one word means two things, when code names differ from how the business talks, or before naming a new domain class.

## Common questions

**Do we need a glossary document?**
A short list next to the code is enough. Keep it current or delete it.

**What if two areas truly use a word differently?**
Give each meaning its own name inside its own area and use [map-bounded-contexts](./map-bounded-contexts.md) for the boundary.

## It's working if

- A domain expert recognizes the main class and method names.
- Each term has one meaning in its area, and tests read like business statements.

## Where it fits

Opens the domain set and feeds [model-domain-building-blocks](./model-domain-building-blocks.md) and [make-implicit-concepts-explicit](./make-implicit-concepts-explicit.md). Router: [domain-driven-design](./domain-driven-design.md).
