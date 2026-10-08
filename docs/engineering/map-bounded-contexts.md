## What it does

Finds where models differ, names and bounds each context, chooses a relationship for every link (shared kernel, customer/supplier, conformist, anticorruption layer, open host, published language, separate ways), and plans change.

Keeps one team's model from being corrupted by another's, and makes integration costs visible.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when one concept means different things in different places, when integrating legacy or external systems, or when splitting or merging systems.

## Common questions

**Is a context the same as a microservice?**
No. A context is a model and language boundary; it can live in one process or span services.

**When is an anticorruption layer worth it?**
When the upstream model is foreign or poor and you need to keep your own clean.

## It's working if

- Each context has a name, owner, and consistent vocabulary.
- Every link has a named relationship, direction, and contract.

## Where it fits

Pairs with [distill-core-domain](./distill-core-domain.md) and [evolve-large-scale-structure](./evolve-large-scale-structure.md). Resolves conflicts found by [build-ubiquitous-language](./build-ubiquitous-language.md). Router: [domain-driven-design](./domain-driven-design.md).
