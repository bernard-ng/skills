## What it does

Finds domain ideas buried in flags and conditionals and makes them specifications, constraints, process objects, or policies in the language of the business.

Lets rules be named, combined, tested, and changed in one place.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when eligibility or validation logic is repeated, status flags encode rules, or experts use a word the code does not have.

## Common questions

**Should every condition become an object?**
No. Extract when the rule is domain-meaningful, repeated, combined, swapped, or discussed by the business.

**Specification or policy?**
A specification answers whether something holds. A policy chooses how to decide or compute.

## It's working if

- A domain expert can find each important rule by name.
- Combined rules read like the business statement.

## Where it fits

Often follows [build-ubiquitous-language](./build-ubiquitous-language.md); its elements feed [shape-supple-design](./shape-supple-design.md) and [refactor-toward-deeper-insight](./refactor-toward-deeper-insight.md). Router: [domain-driven-design](./domain-driven-design.md).
