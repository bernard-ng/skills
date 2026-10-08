# Specification notes

## Shape

A specification answers one question about a candidate. Keep the signature narrow.

```
interface Specification<T> {
  isSatisfiedBy(candidate: T): boolean
}
```

Add `reasonUnsatisfied(candidate)` or return a result object when users must know *why* something failed. Name each specification for the business rule, not the code path: `CustomerInGoodStanding`, not `CheckCustomerFlags`.

## Composition

Combine specifications instead of adding flags to one.

```
const eligible = and(
  minimumOrderValue(500),
  not(flaggedCustomer()),
  servicedZone()
)
```

Combinators (`and`, `or`, `not`) are the cohesive mechanism; the domain specifications sit on top and read as statements.

## Where it runs

| Job | Notes |
| --- | --- |
| Validate | Run in memory against the object. Fail early, report the reason. |
| Select | Pass to the repository. For small sets, filter in memory. For large sets, translate to a query. Keep the specification as the source of truth. |
| Build to order | Use as the acceptance test for a factory or search result. |

## Making queries safe and fast

- Let the repository expose a method that takes a specification, or expose named finders implemented from specifications.
- If the in-memory and database versions must both exist, test that they agree on the same cases.
- Do not leak table or column names into the specification itself.

## Signals to stop

- Specifications that need other specifications' internals.
- Specifications that need to mutate the candidate.
- A specification so large that the business cannot recite it. Look for a missing concept first.

## Policies in one line

A policy (strategy) chooses *how* something is decided or calculated; a specification answers *whether* something holds. Use the same naming discipline for both.
