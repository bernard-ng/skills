# Supple design checks

## Symptom to move

| Symptom | Move |
| --- | --- |
| Reader must open the method body to know what it does | Rename for intent; write usage first |
| Calling order matters, but nothing says so | Add a prerequisite check, or fold steps into one command |
| A getter-like method also changes state | Split query from command |
| Complex derivations scattered across entities | Move into value objects with pure operations |
| Test needs many objects set up | Reduce dependencies; isolate the logic in a standalone class |
| A rule change edits many classes | Regroup along the rule's conceptual contour |
| Chained operations need conversions between types | Look for closure of operations |
| Client code is long and procedural | Declarative combination of named elements |
| Computation overwhelms the concept | Extract a cohesive mechanism behind a clear interface |
| Home-made math, dates, or accounting | Adopt an established formalism |

## Quick tests

- **Name test.** Can a domain expert guess the effect from the name?
- **Contract test.** Is there a sentence that says what is true after this call?
- **Isolation test.** Can this class be tested with no mocks, or with one?
- **Change test.** If the business rule changes, is the edit local?
- **Combine test.** Can two results be combined without conversion?

## Writing assertions

```
book(appointment):
  requires: appointment fits in an open slot
  ensures:  no two appointments overlap; appointment is present
```

Put these where the language lets you: contract libraries, guard clauses, tests with these names, or doc comments. The point is that someone can predict behavior without reading the code.

## Side-effect-free helpers

When a command needs a hard computation, compute with a function that returns a value, then apply the result. The function is easy to test and reuse; the command stays small.
