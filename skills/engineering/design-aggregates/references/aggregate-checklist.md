# Aggregate checklist

Run through this when drawing or reviewing a boundary.

## Boundary

- [ ] Every cluster exists to protect a named invariant.
- [ ] Nothing in the cluster could be moved out without breaking an invariant.
- [ ] Nothing is in the cluster only because it is "related".
- [ ] Typical changes touch one aggregate.

## Root and identity

- [ ] One root; outside code holds only the root.
- [ ] Inner objects have local identity only.
- [ ] References to other aggregates are by identity.
- [ ] Inner state is changed through root methods named for business actions.

## Creation

- [ ] A new aggregate is valid the moment it exists.
- [ ] Creation rules sit in one place (constructor or factory).
- [ ] Loading from storage does not rerun creation rules.
- [ ] Factory inputs are the minimum the business needs, not a pile of optional fields.

## Persistence and queries

- [ ] A repository exists for each root and for no inner object.
- [ ] Queries have names from the language of the domain.
- [ ] Callers control when a unit of work commits.
- [ ] Concurrent change is detected (version, lock, or conflict handling) where it matters.

## Cross-aggregate work

- [ ] Immediate versus eventual consistency is decided per rule.
- [ ] Follow-on changes are idempotent or can be retried.
- [ ] A failure in the second step has a defined recovery.

## Sizing heuristics

- Prefer boundaries drawn around *one change* the business makes, not one noun.
- If loading is slow or contention is high, the cluster is probably too big.
- If an invariant is repeatedly violated, the cluster is probably too small or the root is bypassed.
