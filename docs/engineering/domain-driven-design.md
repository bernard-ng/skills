## What it does

The router for domain modeling. It starts from a shared language and a model that code and business both recognize, then sends each decision (building blocks, consistency boundaries, hidden rules, supple interfaces, deeper insight, context boundaries, core focus, large-scale structure) to a specialist.

Keeps domain rules out of glue code and matches design effort to how complicated the domain really is.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a task involves business rules, domain vocabulary, or model boundaries: "model the domain", "where is this business logic", "bounded context", "aggregate". For one narrow decision, go straight to the specialist, for example [design-aggregates](./design-aggregates.md).

## Common questions

**Do I apply all of it to a CRUD screen?**
No. Simple data entry and reporting need little model. Match the effort to the complexity.

**How does it relate to the object design skills?**
This set decides what the model is and where its edges are. The object design set decides how the pieces inside divide work. They share the same repository conventions.

## It's working if

- The brief lists agreed terms, concept kinds, consistency boundaries, model boundaries, and what is core.
- Open questions for domain experts are listed instead of guessed.

## Where it fits

The hub of the domain modeling set. [build-ubiquitous-language](./build-ubiquitous-language.md) usually opens it; [distill-core-domain](./distill-core-domain.md) and [map-bounded-contexts](./map-bounded-contexts.md) set strategy. Object-level work continues in [responsibility-driven-design](./responsibility-driven-design.md).
