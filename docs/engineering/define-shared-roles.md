## What it does

Finds what candidates have in common, decides whether the role becomes an interface, abstract class, concrete class, or function, and prefers polymorphism to asking what kind of thing an object is.

It blurs distinctions the software never acts on.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when classes look alike, a client branches on kind, or someone asks "interface or abstract class?".

## Common questions

**When is inheritance right?**
For a real "is a kind of" with shared duties. For reuse or variation, composition and delegation are usually safer.

## It's working if

- A shared role has a purpose and duties every member honors, and collaborators no longer ask the kind.

## Where it fits

Works with [choose-control-style](./choose-control-style.md) (removing type checks) and [apply-design-patterns](./apply-design-patterns.md). Map: [router](./responsibility-driven-design.md).
