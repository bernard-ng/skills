---
name: shape-supple-design
description: Use when a domain model is correct but hard to use, combine, test, or change, when callers must know implementation details or call order, when methods have hidden side effects, when a change in one class ripples through many, when interfaces are named for how they work rather than what they mean, when "this is hard to test", or the user asks to make a model "flexible", "composable", or "readable". Apply automatically when designing or reviewing public domain interfaces and operations.
---

# Shape supple design

A design is supple when the people changing it can understand the effect of a change, combine parts freely, and feel the code is pleasant to work in. A model that is only correct is not enough: you also have to be able to build on it. Apply these moves to the core domain first; elsewhere they are optional.

## Moves

1. **Reveal intent through the interface.** Name classes and operations for the purpose they serve, not the mechanism. A caller should not need to read the body to know what a method does. Write the test or usage first, in domain terms, then implement. Hide how, state what.
2. **Isolate side effects.** Separate operations that *answer* from operations that *change*. Queries return results and do not alter state. Commands change state and return nothing meaningful, or confirm. Push computation into functions on immutable values that return new values; keep the few state-changing commands small and obvious. A value object's operation produces a new value instead of altering itself.
3. **State rules as assertions.** For commands, say what is true afterward. For operations with prerequisites, say what must be true before. For aggregates and entities, say what is always true. Write these as tests, as code-level checks where the language supports them, or as plain-language comments next to the operation. If an operation has a surprising effect, the model is hiding something.
4. **Follow conceptual contours.** Decompose along the lines where the domain naturally breaks apart and changes at different rates. If a small change in business rules forces edits to many classes, the contours are wrong. If tiny behaviors are split across tiny classes, or large ones are chunked arbitrarily, regroup until a change touches one place and a concept appears whole.
5. **Reduce dependencies to the minimum.** Aim for classes that can be understood alone. Every dependency a reader must hold in mind is a cost. Look at imports, parameters, and collaborators; remove the ones that are only incidental. Push essential dependencies to the model's core concepts.
6. **Close operations over their type where it fits.** When an operation takes arguments of a type and returns the same type, results can be chained and combined without bringing in other types (`range.union(other)`, `money.plus(other)`, `rule.and(other)`). Use closure when it is natural. Do not contort the model to force it.
7. **Prefer a declarative style in the core.** When the model has a few clear elements that combine unambiguously, client code can describe *what* it wants (`eligible = and(a, b)`; a rule table; a fluent builder) instead of how to compute it. Leave the mechanics inside the elements. Use `make-implicit-concepts-explicit` for the elements, and extract a cohesive mechanism (a graph traversal, a scheduler) from the core when computation drowns the concept.
8. **Use established formalisms.** When the domain already has a rigorous way of thinking (accounting, units of measure, scheduling, graph theory), model with it instead of inventing your own. Its operations and laws are known, documented, and testable.

## Procedure for a review

1. Pick the most-used operation in the core and read it without its body. Is the purpose clear?
2. List the operations that both return a value and change state; split them.
3. Try to write a test for a command using only its name and assertions; if you cannot, the contract is unclear.
4. Make a small change in the business rules; count the files touched. If more than a handful, look for a contour.
5. Take the heaviest class; list what it needs to be understood. Remove or hide what is incidental.

## Guardrails

Do not spend the whole effort here on supporting code. Do not make everything immutable at the cost of clarity or performance where mutation is local and safe. Do not make a general-purpose abstraction for a case you cannot name. Match the repository's idiom for immutability, errors, and builders. Keep the interface small enough to remember.

## Check

Callers understand an operation from its name and contract. Queries are side-effect-free. Rules are stated or tested. One business change touches one place. Core classes stand alone or with a small, obvious set of collaborators.

**Illustrative case:** `schedule.add(appointment)` silently shifts other appointments and sends emails. Split it: `schedule.canFit(appointment)` is a query, `schedule.slotsAfter(time)` returns values, `schedule.book(appointment)` changes only the schedule and guarantees "no overlaps afterward", and notifications are a separate step triggered by an event.

## Reference material

- [Supple design checks](references/supple-checks.md): symptom to move table and quick tests.
