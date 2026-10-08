---
name: build-ubiquitous-language
description: Use when domain terms are fuzzy, overloaded, or translated between people, tickets, and code, when the same word means different things, when developers and domain experts describe the same rule differently, when naming a new domain class or method, or the user asks for a glossary, "what should we call this", or "model the business". Apply automatically before modeling a domain concept and whenever a name in code does not match how the business talks.
---

# Build a ubiquitous language

A model is only useful if everyone can talk with it. When business people use one vocabulary, developers another, and the code a third, every conversation needs translation, and meaning leaks at each step. Make one language, drawn from the model, and use it in speech, documents, tests, and code.

## Procedure

1. **Collect real sentences.** From requirements, tickets, existing code, support logs, and (when available) experts, list how people actually describe the behavior: "a loan lapses when…", "we hold the slot until…". Keep the verbs, because they often point to missing operations.
2. **Find the conflicts.** Mark every word that has two meanings, every meaning with two words, and every phrase that needs explaining. Each one is a modeling question, not just a naming one.
3. **Try the sentences against the model.** Say the rule aloud using the class and method names. If the sentence sounds awkward, wrong, or needs words the model does not have, the model is missing a concept or has one that does not exist in the business.
4. **Resolve each term.** Pick one name, write a one-line definition that says what it is and what it is not, and note where it applies. If a word truly has different meanings in different areas, hand that to `map-bounded-contexts` and give each meaning a separate name inside its own area.
5. **Put the language in the code.** Class, method, parameter, test, and module names use the agreed terms. Delete or rename names that exist only for technical reasons when a domain word exists. Name tests as sentences from the domain.
6. **Treat language change as model change.** A new term, a retired term, or a changed definition is a refactoring of the model. Rename in the code in the same change, and record the term.
7. **Keep it alive.** Use the terms in commit messages, pull request descriptions, and reviews. Challenge deviations gently: "the business says 'booking', here it is `Reservation`; which is right?"
8. **Record it lightly.** A short glossary near the code (see the template) beats a long document. Add terms when they are decided, remove them when retired.

## Techniques for exposing a weak model

- **Awkwardness is a signal.** If a sentence only works with an unnatural construction, a concept is hiding.
- **Ask an expert to react to the model, not read it.** Walk a scenario using the code's words and watch for corrections.
- **Search for gaps in the other direction.** When an expert uses a word that has no class, method, or enum value, add it or explain why not.
- **Resolve contradictions in the data.** Fields that are used differently by different teams, or free text that carries rules, show where the model is too thin.

## Guardrails

Do not invent domain terms to sound businesslike. Do not rename widely used public APIs without a migration path; record the mismatch and move gradually. Do not insist on one global vocabulary across areas that truly differ. Do not let the glossary become a document no one reads.

## Check

A domain expert could read the main class and method names aloud and recognize the business. Each term has one meaning in its area. Conflicts are either resolved or assigned to different areas. Tests read like statements about the business.

**Illustrative case:** A library system has `Loan.expire()` in code while staff say "a hold lapses" and "a loan is overdue". Those are two different rules with different consequences. The model gains `Hold` (with `lapse()`) and `Loan` (with `isOverdue()`), the glossary records both, and the test names change from `testExpire` to `holdLapsesAfterPickupWindow`.

## Reference material

- [Glossary template](references/glossary-template.md): the smallest useful format for a term list and a sentence log.
