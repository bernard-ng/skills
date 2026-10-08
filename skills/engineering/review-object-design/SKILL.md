---
name: review-object-design
description: Use when reviewing a design, pull request, or class structure for quality, when asked "is this good design", "review my classes", "why is this hard to change", or "refactor this", when a class has dozens of methods or a controller gathers data and decides, when one change ripples through many classes, or after a design session before coding. Apply automatically to check roles, duties, and collaborations for coherence, consistency, and coupling, and to suggest concrete moves.
---

# Review object design

Judge a design by how well each part fits its context and how well the parts hold together. A design is proved by how it stands up to requirements over time, so review for the likely next change as well as for today's behavior.

## Procedure

1. **Reconstruct the intent.** For each important object write its role and the scenario that uses it. If you cannot, say so and ask; do not guess intent.
2. **Run the object tests.**
   - Does it stick to its purpose?
   - Are its duties clearly stated?
   - Do its duties match its role stereotype?
   - Is it of value to the objects around it?
3. **Look for these smells.** For each, name a concrete move.

   | Smell | Move |
   | --- | --- |
   | One object knows or does too much; a laundry list of unrelated duties | Split along the purposes it serves; keep each piece coherent. |
   | A controller interrogates passive holders and decides for them | Move the decision to the holder that has the facts; keep sequencing in the controller. |
   | Behavior separated from the information it uses; updates between objects to keep copies in sync | Keep behavior with its information; keep one fact in one place. |
   | A tiny object used by one client | Merge it into the client as helper methods. |
   | Lots of messages, little work; chatty clients | Bundle into intention-level requests. |
   | Branching on type or kind | Give the kinds a shared role and let each answer for itself. |
   | Duties that overlap; the same check in several places | Decide the owner; remove the duplicate. |
   | A big relationship burden (a Person that knows every pet and policy) | Give non-intrinsic relationships to new structurers. |
   | Lower-level objects that depend on higher-level ones | Invert the dependency or split the duty. |
   | Deep call chains into other objects' parts | Ask the enclosing object; hide structure that may change (see `design-object-connections`). |
   | Primitives passed everywhere | Introduce small concept objects. |
   | A hub that every path crosses | Redistribute its duties. |
   | Flexibility without evidence; hooks nobody uses | Remove, or demand the evidence (see `design-variation-points`). |
   | Exceptions that are only logged; redundant validation; embellished recovery | See `design-reliable-collaborations`. |
   | A pattern that does not match the problem | See `apply-design-patterns`. |

4. **Check consistency.** Objects are grouped in neighborhoods; few lines of communication run between them; no object knows, does, or controls too much; objects act in character; similar problems are solved in similar ways; a few collaboration patterns repeat. If a framework or architecture dictates a style, check that the design follows it.
5. **Check coupling.** If every part is connected, the effects of change cannot be limited. Identify subsystems and the paths between them. Ask what changes if the next expected variation arrives, and where it would go.
6. **Check the control centers.** Each should have a stated style. Similar workflows should look alike.
7. **Test with a scenario.** Walk one normal path and one alternate path through the code or cards (see `trace-object-collaborations`).
8. **Report.** Order findings by how much they will hurt, with the object, the evidence, why it matters, and a concrete move. Mark what you could not verify. Suggest the smallest change that fixes the problem.

## Guardrails

There are no laws that always lead to good design; the Law of Demeter and similar rules are guidelines. A different style is not a flaw. Do not demand patterns, layers, or interfaces without a problem to solve. Do not rewrite working code to match a preference. Respect framework and repository conventions.

## Check

Every finding names a role or collaboration, cites evidence, and offers a move. Praise what is sound and consistent. The review distinguishes defects from preferences.

**Illustrative finding:** "`InvoiceService` fetches line items and customer data through getters and computes discounts itself, while `Invoice` only stores values. Move discount rules into `Invoice` (it holds the facts) and keep `InvoiceService` as the sequencing coordinator."
