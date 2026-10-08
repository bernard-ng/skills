## What it does

The router for object design. It designs from behavior toward code: roles first, then duties, collaborations, control, reliability, and justified flexibility, and it names the specialist to call for each decision.

It treats a role as something an object plays, so a candidate does not have to become a class, and it keeps the design brief short.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a task is about how objects, classes, modules, or services divide work: "design the classes for", "where should this logic live", "this class does too much". For one narrow decision, go straight to the specialist, for example [assign-object-responsibilities](./assign-object-responsibilities.md).

## Common questions

**Do I need the whole flow for every feature?**
No. A small local change needs only the focused skill that matches the pressure. The router never asks for ceremony.

**Does it require UML or cards?**
No. Cards and diagrams are optional working notes. The output is a short design brief.

## It's working if

- The brief explains a normal scenario and one consequential alternate path through the roles.
- Decisions come with the trade-off and the alternative that was rejected.
- Open questions are listed instead of guessed.

## Where it fits

The hub of the engineering set. [frame-design-problem](./frame-design-problem.md) opens the flow; [review-object-design](./review-object-design.md) closes it.
