---
name: distill-core-domain
description: Use when deciding where design effort, the strongest developers, or refactoring time should go, when generic code such as dates, permissions, or workflow crowds out the business heart, when a large codebase has no clear statement of what matters, when choosing between building, buying, or outsourcing a part, when onboarding people to a big model, or the user asks about "core domain", "supporting subdomain", "generic subdomain", or "what is the heart of this system". Apply automatically at project start and when prioritizing work across a large domain model.
---

# Distill the core domain

In a big system every part is necessary, and almost every part is complicated. If all parts get equal attention, the thing that makes the software worth building gets neglected, usually because strong developers drift toward interesting technical problems and leave the business heart to whoever is left. Distillation separates what is *distinctive* from what is merely *needed*, and then directs effort accordingly.

## Procedure

1. **Name the core.** Ask: what in this model would a competitor struggle to copy, and what would hurt most if wrong? The answer is a small set of concepts and rules, usually fewer than first thought. It depends on viewpoint: what is core for a currency trader is generic for a shop. Expect to revise it.
2. **Write a one-page vision statement.** Describe the value the model brings and which interests it balances. Leave out screens, platform, and performance details. Write it early; revise it as you learn. Use it to settle disputes over priorities.
3. **Make the core visible.** If you cannot restructure yet, flag it: a short distillation document (three to seven sparse pages listing the key concepts and their primary interactions, readable by non-developers), or markers in the code and diagrams. A change that forces the document to change is a signal to consult the team.
4. **Pull generic subdomains out.** Find cohesive parts that any business needs (time zones, access control, accounting, notifications, workflow). Move them into their own modules with nothing specific to your business in them. Then decide for each, cheapest first:
   - Adopt an off-the-shelf library or service, after evaluating fit and cost.
   - Follow a published model or a standard in the field.
   - Outsource it, with a clear interface and acceptance tests.
   - Build it in-house, minimal, and only what you need.

   Do not design generic parts for reuse; implement what the current use needs, but keep it free of your specifics.
5. **Extract cohesive mechanisms.** When an algorithm (graph traversal, scheduling, rule evaluation, pricing math) clutters the model, move it behind an intention-revealing interface so the model states *what* and the mechanism handles *how*. A model proposes; a mechanism disposes. Keep a mechanism inside the core only when it is itself proprietary and distinctive.
6. **Segregate the core.** When the core is entangled with supporting code, move its classes into their own module and sever dependencies that are not part of the concept. Do it incrementally. Put the leftovers in modules named for their meaning. Expect some insight to shift the boundary; share it with the team. Agree as a team, since an individual cannot redefine the core alone.
7. **Consider an abstract core.** If the core's modules interact heavily, express the most fundamental concepts as abstract types or interfaces in their own module, and let specialized modules depend on that, not on each other. Use only where the abstractions are real domain concepts, not a technical trick.
8. **Aim effort at the core.** Assign the strongest developers and the closest contact with experts to the core. Choose core refactorings over others. Put the first end-to-end slice through the core, not through a supporting feature. Justify investment elsewhere by how it supports the core.

## Guardrails

Do not declare everything core. Do not distill by renaming folders. Do not spend core talent on generic subdomains. Do not hand the core to short-term outside developers or lock it into a restrictive framework. Do not treat the vision statement as a marketing document. Follow existing module and ownership conventions rather than inventing a parallel structure.

## Check

The core can be stated in a page and located in the code. Generic parts have a chosen sourcing route and carry no business specifics. Mechanisms hide behind clear interfaces. Priorities and staffing follow the core.

**Illustrative case:** A clinic-scheduling product spends sprints on calendar sync, notifications, and a permissions model while its distinctive value is matching patients to clinicians under care-continuity rules. The vision statement names the matching model as the core; calendar sync is delegated to a library, permissions to a standard identity service, and the matching rules move to a segregated `Matching` module with the strongest developers and a clinical expert.

## Reference material

- [Vision statement and core document](references/vision-and-core-document.md): outlines for the two short artifacts.
