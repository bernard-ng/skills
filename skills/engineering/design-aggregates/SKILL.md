---
name: design-aggregates
description: Use when drawing consistency boundaries in a domain model, when an invariant spans several objects, when transactions touch too many records or lock too much, when deciding what a repository returns, when object creation is complex or can leave an invalid state, when ORM entities expose their whole graph, or the user asks about "aggregate", "aggregate root", "factory", "repository", or "unit of work". Apply automatically when designing creation, persistence, or invariants for related domain objects.
---

# Design aggregates

A model of connected objects has no natural edges. Without edges, no one can say what must stay consistent together, what may be loaded together, or what a transaction covers. An **aggregate** is the cluster you treat as one unit for change: one entry point, one set of invariants, one consistency boundary.

## Procedure

1. **List the invariants.** Write the rules that must be true *at all times* for a group of objects ("the total of line items never exceeds the credit limit", "a room has at most one booking per slot"). An invariant that crosses objects is the reason an aggregate exists. A rule that can be briefly out of date does not need to be inside one.
2. **Draw the smallest cluster.** Include only the objects needed to enforce those invariants in a single change. Keep it small: large clusters cause contention, slow loads, and tangled code. Prefer many small aggregates linked by identity over one that owns the world.
3. **Pick the root.** One entity is the entry point and the only object outside code may hold or call. Internal objects get identity only meaningful inside the aggregate. Outside code asks the root to do things; the root enforces the invariants and may hand out copies or read-only views of inner parts.
4. **Reference other aggregates by identity.** Hold the other root's id, not a live object, so each aggregate loads, locks, and changes alone. Load the other one through its repository when a rule needs it.
5. **Change one aggregate per transaction.** If a use case must change two, the second change may follow later (event, queue, retry) with the rule that the whole business state converges. Decide explicitly which consistency is immediate and which is eventual, and ask a domain expert what delay is acceptable.
6. **Create with factories when construction is real work.** A constructor is enough when it builds a valid object from its arguments. When creation involves assembling the root and its inner parts, deriving values, or choosing among kinds, put it in a factory (a factory method on a related object, a static method, or a dedicated factory) that produces a *valid, complete* aggregate in one step or fails. Reconstituting a stored aggregate is a different job from creating a new one; do not run new-object rules on old data.
7. **Provide repositories for roots only.** A repository for an aggregate root gives the illusion of an in-memory collection: add, remove, find by identity, and find by meaningful query. Do not create repositories for inner objects. Keep storage details inside the repository; the client decides when work commits. Express complex queries as named, domain-meaningful methods or specifications (see `make-implicit-concepts-explicit`).
8. **Test the boundary.** Try to break an invariant through any public path. If outside code can mutate inner objects directly, or two requests can corrupt it concurrently, tighten the root or add a concurrency guard (version check).

## Warning signs

- Every entity has its own repository and its own transaction.
- A change to one object locks half the schema.
- Services mutate inner objects behind the root's back.
- Constructors accept half-formed objects and rely on setters to finish the job.
- Eager loading pulls in a large graph on every read.

## Guardrails

Do not make an aggregate because two tables are joined. Do not let storage layout draw the boundary. Do not bypass the root for speed without recording the trade-off. Do not force strong consistency where business can tolerate delay. Follow the repository's persistence style; the ideas hold under an ORM, document store, or event store.

## Check

Each invariant has an owner. Outside code touches only roots. Cross-aggregate links are identities. A use case changes one aggregate per transaction, or says why eventual consistency is acceptable. Creation yields valid objects.

**Illustrative case:** An `Order` root owns its `OrderLine`s and enforces "total never exceeds the account's credit limit" using a limit value passed in. It holds the `CustomerId`, not a `Customer`. Placing an order changes only the order; reserving stock is a separate `StockReservation` aggregate updated after, with a compensating step if it fails. `OrderRepository` exposes `byId` and `openFor(customerId)`, and nothing for lines.

## Reference material

- [Aggregate checklist](references/aggregate-checklist.md): sizing, identity, and boundary tests in one list.
