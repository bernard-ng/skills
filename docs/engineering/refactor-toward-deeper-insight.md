## What it does

Notices strain, finds the concept behind it through language, contradictions, and prior art, explores in a small time box, and reshapes the model so special cases disappear.

Separates refactoring for tidiness from refactoring that changes what the model means.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when each new requirement adds a special case, experts keep correcting the model, or a rewrite looms.

## Common questions

**When should I wait?**
When the area is supporting, when you have no better model yet, or when a deadline needs only a fix. Note the debt.

**Do I need tests first?**
Yes. Capture current behavior before reshaping.

## It's working if

- Special cases disappear instead of moving.
- The change deletes more than it adds.

## Where it fits

Supported by [make-implicit-concepts-explicit](./make-implicit-concepts-explicit.md) and [shape-supple-design](./shape-supple-design.md); aims first at the core from [distill-core-domain](./distill-core-domain.md). Router: [domain-driven-design](./domain-driven-design.md).
