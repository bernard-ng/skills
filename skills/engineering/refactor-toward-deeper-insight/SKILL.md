---
name: refactor-toward-deeper-insight
description: Use when every new requirement adds a special case to the same domain code, when domain experts keep correcting the model, when a design feels shallow or clumsy even though tests pass, when there is a temptation to rewrite or to add yet another flag, when a recurring problem looks like a known business pattern, or when planning a refactor of core domain code. Apply automatically when a model shows strain from new requirements or when a conversation with an expert reveals a concept the code lacks.
---

# Refactor toward deeper insight

Refactoring for tidiness cleans code. Refactoring for insight changes the *model*: you discover what the business really means, and the code reorganizes around it. This is the usual way a shallow model becomes a deep one, and it rarely happens in one step.

## Procedure

1. **Notice the strain.** Triggers include special cases piled up, terms in conversation that have no code, awkward tests, the same rule restated in two places, an expert saying "no, that's not how it works", and a feature that "should be simple" but is not.
2. **Name what feels wrong.** Write down the awkwardness in plain words and in domain words. Try the sentence aloud; see `build-ubiquitous-language`.
3. **Look for the concept behind it.**
   - Listen to the language experts use for the strained area.
   - Check for contradictions between what different experts say; those often hide two concepts.
   - Read what the field already knows (standard models for accounting, scheduling, inventory, contracts). Reuse before inventing.
   - Try an alternative model on paper and walk the same scenarios through both.
4. **Explore with a small team.** Pair a developer who knows the code with an expert, set a short time box, and try several models. Keep the sessions concrete: scenarios, not abstractions. Discard what does not simplify the cases.
5. **Prefer small, safe steps, and allow a leap.** Refactor in steps that keep tests green. When the tests show a new model is clearer, accept a breakthrough: reshape the classes, delete the old special cases, rewrite tests in the new language. Plan for the cost of migrating stored data and callers; keep the old and new in parallel when needed.
6. **Know the common outcomes.**
   - A hidden concept becomes explicit (see `make-implicit-concepts-explicit`).
   - Two meanings split into two concepts.
   - A set of special cases collapses into one general rule plus data.
   - A tangled operation splits along a contour (see `shape-supple-design`).
   - A mechanism moves out so the model can be declarative (see `distill-core-domain`).
7. **Choose where to look.** Spend insight-seeking effort on the core of the model first (see `distill-core-domain`). If you can only fix one area, fix the one that connects the core to its supporting parts.
8. **Re-check with the experts.** Walk the new model through the scenarios that caused pain. Update the glossary. Delete code that the new model made unnecessary.

## When to refactor now

- The strain recurs in two or more requirements.
- The change is in the core of the model.
- An expert has just said something that makes a better model obvious.

## When to wait

- The area is generic or supporting and works.
- You have no better model, only dislike of the current one. Record it and keep an eye out.
- A deadline fits only a fix. Make the fix, note the debt, and schedule the exploration.

## Guardrails

Do not rewrite for aesthetics. Do not refactor without tests that capture current behavior; add characterization tests first. Do not chase abstraction for its own sake; the test of a deeper model is that the hard cases get simpler. Do not impose a pattern; use the one the domain suggests. Do not change a public contract without a path for callers.

## Check

The new model explains the old cases and the new one. Special cases disappeared instead of moving. Experts recognize the new terms. The code deletes more than it adds.

**Illustrative case:** A rental system keeps adding flags to `Booking` (`isWeekendRate`, `isLongTermRate`, `isPartnerRate`). In a session with the rates team, the underlying idea emerges: a rate is a rule with a validity period, and a booking is priced by the rules in force that match its attributes. The flags and conditionals are replaced by `RateRule` objects chosen by a `Pricing` policy, and new rate types become data.
