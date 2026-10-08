## What it does

Lists the invariants that must always hold, draws the smallest cluster that protects each, picks one root, links other aggregates by identity, and designs creation and storage around the boundary.

Makes transactions, locking, and loading follow the business, not the table layout.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when an invariant spans objects, a transaction is too big, creation can leave invalid state, or a repository is being added per table.

## Common questions

**How big should an aggregate be?**
As small as the invariants allow. Prefer several small ones linked by identity.

**What about changes across aggregates?**
Change one per transaction and decide which follow-on updates may be eventual.

## It's working if

- Each invariant has an owner and outside code touches only roots.
- Creation yields valid objects.

## Where it fits

Builds on [model-domain-building-blocks](./model-domain-building-blocks.md). Uses [make-implicit-concepts-explicit](./make-implicit-concepts-explicit.md) for queries. Router: [domain-driven-design](./domain-driven-design.md).
