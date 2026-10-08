---
name: make-implicit-concepts-explicit
description: Use when a business rule, constraint, process, or policy is buried in conditionals, flags, comments, or helper methods, when eligibility or validation logic is repeated or scattered across layers, when status fields and boolean combinations encode states, when a "process" has no object, when swappable calculation rules appear as if-else ladders, or the user asks about "specification", "policy", "strategy", or "business rules". Apply automatically when code expresses a domain idea only indirectly.
---

# Make implicit concepts explicit

Domain experts speak of rules, policies, constraints, and processes. Code often hides them in flags, branches, and utility methods, so they cannot be named, tested, discussed, or changed in one place. Giving each real concept its own object makes the model say what the business says.

## Procedure

1. **Hunt for hidden concepts.** Look for the following in the code and in how people talk:
   - Conditions that recur in several places ("is this order eligible for…").
   - Boolean or status fields whose combinations mean something.
   - Comments that explain a rule.
   - A method with a name like `check`, `process`, `handle`, `calculate` that only a specific scenario uses.
   - Words experts use that have no counterpart in the model.
   - Awkward sentences when you describe the code aloud (see `build-ubiquitous-language`).
2. **Name the concept in domain language.** Ask what the business calls it and what it is for. If the term is not obvious, check established prior art in the field (accounting, scheduling, pricing) before inventing.
3. **Choose the form that fits.**

   | The idea is… | Make it… |
   | --- | --- |
   | A yes/no test about an object, reused or combined | **Specification**: an object with `isSatisfiedBy(candidate)` |
   | A constraint that governs an object's state or change | A named method or small object on the owner, checked where the state changes |
   | A multi-step business procedure with its own state and rules | A **process object** that holds the steps and progress |
   | Alternative ways of computing or deciding that the business can swap | A **policy** (strategy) behind an interface, chosen by the context |
   | A quantity, range, or rule set the business reasons about | A **value object** with the behavior (see `model-domain-building-blocks`) |

4. **Use specifications for three jobs.**
   - **Validate**: does this object meet a requirement? Return pass/fail with a reason when users need to know why.
   - **Select**: find the objects that meet it. Let the repository accept the specification, or translate it into a query for performance.
   - **Build to order**: describe what a new object must satisfy, so a factory or search can produce it.

   Keep specifications small and combinable (`and`, `or`, `not`) so that composite rules read like the business statement. Express each one in terms of domain concepts, not raw columns.
5. **Keep the rule next to its subject.** A specification or policy about an invoice's eligibility is a domain object; do not bury it in a controller or query string. If a rule must run in the database for performance, keep the specification as the single source of truth and generate or double-check the query from it.
6. **Prefer insight over mechanics.** If a specification grows hundreds of lines or an `if` ladder survives, a bigger concept is missing. Take it to `refactor-toward-deeper-insight`.
7. **Test the rule in its own words.** One test per business statement, using the specification or policy directly, plus a test of how the owner uses it.

## Guardrails

Do not wrap every `if` in an object. Extract when the rule is domain-meaningful, repeated, combined, swapped, or discussed by the business. Do not build a generic rules engine when three named specifications will do. Do not let a policy hold hidden state or side effects. Keep the repository's existing patterns and language features (lambdas, function types) if they express the same idea more plainly.

## Check

A domain expert can find each important rule by name. Rules are defined once and reused. Combining rules reads like the business statement. Status flags have been replaced by named states or behavior where they carried rules.

**Illustrative case:** Delivery code checks `if (order.total > 500 && !customer.flagged && zone.isServiced() ...)` in three places. The business calls this "eligible for express shipping". Introduce `ExpressEligibility` as a specification built from `MinimumOrderValue`, `CustomerInGoodStanding`, and `ServicedZone`. The checkout validates with it, a promotions search selects eligible orders with it, and a failure reports which part was unmet.

## Reference material

- [Specification notes](references/specification-notes.md): shape, composition, reasons, and query translation.
