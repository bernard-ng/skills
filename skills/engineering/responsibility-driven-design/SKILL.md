---
name: responsibility-driven-design
description: Use when a task involves designing, reviewing, or refactoring how objects, classes, modules, or services divide work and cooperate, including requests like "design the classes for", "where should this logic live", "this class does too much", "model this domain", "CRC cards", "split this service", or "review my design", and before implementing any feature that spans several cooperating components. Start here and apply automatically when roles, responsibilities, or collaborations must be decided before or during coding.
---

# Responsibility-driven design

Design from behavior toward code. A software system is a community of cooperating objects. Each object plays a **role**: a coherent set of **responsibilities** (things it knows, decides, or does) that can be fulfilled by any compatible object. Roles collaborate by sending requests. Classes, interfaces, functions, and modules are later ways to realize roles, so one candidate does not have to become one class, and a language without classes still has roles.

## Principles

1. **Invent, do not mirror.** Objects represent the machinery the software needs (decisions, coordination, connections, structure), not only nouns from the problem domain. Success is a clear working design, not resemblance to the real world.
2. **Behavior first.** Start from what the system must do for its users and neighbors, then ask which roles should know and do it.
3. **Smart, not omniscient.** Keep behavior with the information it uses, and give collaborators as much responsibility as they can handle. A controller that asks passive data holders for everything, or a class that does everything, is a design smell.
4. **Neighborhoods.** Group objects that work on one problem. Keep few, simple lines of communication between neighborhoods, and give each a single entry point where that helps.
5. **Consistency is quality.** A predictable design reuses a few collaboration patterns, keeps each role in character, and solves similar problems the same way.
6. **Simplest design that fits the evidence.** Add flexibility, reliability machinery, patterns, and documents only where a stated need justifies the cost.
7. **Iterate opportunistically.** Switch between roles, duties, collaborations, and details as each reveals gaps. Early ideas are cheap to change; code is not.

## Flow

1. Unclear problem, many stakeholders, or "where do I start": call the Skill tool with `frame-design-problem`.
2. Find candidate roles: call the Skill tool with `discover-object-roles`, and `name-design-objects` for each new name.
3. Place duties: call the Skill tool with `assign-object-responsibilities`.
4. Test the handoffs: call the Skill tool with `trace-object-collaborations`, and `design-object-connections` for how collaborators find each other.
5. Decide who decides: call the Skill tool with `choose-control-style`, and `place-objects-in-layers` when an architecture or framework shapes the answer.
6. Share structure: call the Skill tool with `define-shared-roles`, and `apply-design-patterns` when a recurring problem matches a known solution.
7. Harden: call the Skill tool with `design-reliable-collaborations` for failures and `design-variation-points` for justified change.
8. Check and communicate: call the Skill tool with `review-object-design`, then `describe-object-collaborations` when others need to understand it.
9. Stuck on a hard, surprising part: call the Skill tool with `solve-revealing-design-problems`.

Each call loads one skill, so make several calls when a step needs several. For a small local change, run only the focused skill that matches the pressure.

## Signals that should fire a skill

| Signal in the request or code | Skill |
| --- | --- |
| Vague feature, "design a system for", conflicting requirements | `frame-design-problem` |
| Unclear classes, nouns turned into classes, class with no purpose | `discover-object-roles` |
| Manager, Helper, Util, Data, or Info names; generic or clashing names | `name-design-objects` |
| God class, anemic data holders, getters feeding a decision elsewhere | `assign-object-responsibilities` |
| Use case crossing objects, long call chains, unclear handoffs | `trace-object-collaborations` |
| Objects reaching through objects, many low-level calls, primitives everywhere | `design-object-connections` |
| Big controller or handler, repeated type checks, state flags | `choose-control-style` |
| Layers, framework hooks, service entry points, request flow | `place-objects-in-layers` |
| Similar classes, one interface for many kinds, inheritance for reuse | `define-shared-roles` |
| "Use a pattern", a pattern named in the request, a recurring problem | `apply-design-patterns` |
| Retries, exceptions, partial failures, catch-and-log, trust boundaries | `design-reliable-collaborations` |
| "Make it extensible", config flags, future variants | `design-variation-points` |
| Design or code review, refactor request, "is this good design" | `review-object-design` |
| Design doc, diagram request, PR explaining a structure | `describe-object-collaborations` |
| Repeated failed attempts, "this keeps getting harder" | `solve-revealing-design-problems` |

## Reference material

- [Role stereotypes](references/role-stereotypes.md): what each stereotype typically knows, does, and needs.
- [Design cards](references/design-cards.md): the low-tech CRC card and the hot-spot card, and when they help.

## When the design is good enough

Move to implementation when objects, duties, and collaborations are no longer guesses, they fit together in a consistent pattern, the natural divisions are preserved, and the hard places have been explored. Map stable roles onto the repository's language and architecture. Existing frameworks, conventions, and tests win over a clean-sheet design.

## Guardrails

Do not force every candidate into a class, every collaboration into a pattern, or every request through a controller. Do not require UML, cards, or documents. Do not design for variations, failures, or scale the evidence does not show. Do not invent requirements; mark assumptions and open questions.

## Output

A short design brief: the behavior and constraints, the roles with their responsibilities and collaborators, one normal scenario and one consequential alternate path traced through them, the decisions and trade-offs made, and the open questions. Add a diagram or card set only if it clarifies something the text does not.
