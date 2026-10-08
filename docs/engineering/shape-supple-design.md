## What it does

Applies intention-revealing names, query/command separation, assertions, conceptual contours, minimal dependencies, closure of operations, and declarative style to the core of the model.

Makes a correct model also pleasant to change, combine, and test.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a model is correct but hard to use, when calls hide side effects, or when a change ripples through many classes.

## Common questions

**Should I make everything immutable?**
Not at the cost of clarity. Immutability pays most in value objects and pure computations.

**Where first?**
In the core of the model. Elsewhere it is optional.

## It's working if

- Callers understand an operation from its name and contract.
- One business change touches one place.

## Where it fits

Works with [make-implicit-concepts-explicit](./make-implicit-concepts-explicit.md) and [distill-core-domain](./distill-core-domain.md). Router: [domain-driven-design](./domain-driven-design.md).
