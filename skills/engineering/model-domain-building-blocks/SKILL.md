---
name: model-domain-building-blocks
description: Use when deciding whether a domain concept should be an entity, a value object, a domain service, or a module, when designing identity and equality, when a class is mutable but should not be, when "Service" or "Manager" classes hold all the logic, when associations are bidirectional or many to many, when business logic sits in controllers or database code, or the user asks "entity or value object". Apply automatically when introducing or reviewing a domain class, operation, or association.
---

# Model domain building blocks

Most domain trouble starts with putting a concept in the wrong kind of box. Choose the kind by what the concept means in the business, then let the kind drive identity, mutability, and where behavior lives.

## Procedure

1. **Keep the domain separate.** Isolate domain code from presentation, orchestration, and storage so it can be read without them. Use `place-objects-in-layers` for the surrounding structure. The domain layer holds concepts and rules, not screen state or SQL.
2. **Classify each concept by its meaning.**

   | Question | If yes |
   | --- | --- |
   | Does the business track *this particular one* over time, even as its attributes change? | **Entity**: define identity |
   | Does the business care only about what it *is*, so two with the same attributes are interchangeable? | **Value object**: define by attributes |
   | Is it an operation that does not naturally belong to any one object, and has no state of its own? | **Domain service** |
   | Is it a group of concepts that change together and tell one part of the story? | **Module** |

3. **Entities: choose identity deliberately.** Decide what makes two instances "the same" for the business, then make that explicit: an assigned key, a natural key, or a generated one. Do not compare entities by all their attributes. Keep the entity focused on identity, lifecycle, and the behavior that changes it; move descriptive attributes into value objects when they form a concept.
4. **Value objects: make them small, whole, and immutable.** Group attributes that form one concept (an amount and a currency, a date range, an address) into a single type that validates itself, compares by value, and returns a new instance on change. Immutable values can be shared safely, passed freely, and used as keys. Prefer a value object over a bare primitive when the primitive carries rules or units.
5. **Services: use sparingly, name by activity.** When an operation is a significant business activity, involves several objects, and would distort any one of them if attached, make a stateless service named in the language of the domain (`FundsTransfer`, `RouteFinder`). Do not park every operation in a service; that leaves entities as passive data holders. Separate domain services from application services (coordination) and technical services (infrastructure).
6. **Simplify associations.** Every association is a commitment. Reduce them by requiring one traversal direction, by adding a qualifier that narrows many to one, or by removing associations that are not essential. A bidirectional link between two entities is a smell. Replace navigation with a lookup through a repository when traversal is rare.
7. **Group by meaning.** Place concepts in modules named in the domain language, with high cohesion and few outgoing dependencies. Split a module when the story it tells has more than one subject. Do not group by technical type.
8. **Place behavior with the knowledge.** After classifying, check that the rules live on the objects that hold the relevant information. If an entity is just getters and a service holds the logic, return to `assign-object-responsibilities`.

## Common corrections

- A mutable "value" with setters: split into an immutable value and, if needed, an entity that holds it.
- A `User` identified by every field: identify by a stable key; let the other fields change.
- A `StatusManager` with all the lifecycle rules: move the rules to the entity whose status it is.
- A `Money` passed as a `decimal` plus a separate currency string: make `Money`.

## Guardrails

Do not give every class an ID. Do not make an entity of something the business never tracks individually. Do not put persistence or framework attributes into the meaning of the concept. Do not create a service because a class feels full; fix the class's responsibilities first. Follow the language, framework, and conventions already in the repository for equality, immutability, and mapping.

## Check

Each concept has a kind and a reason. Identity is explicit for entities. Values are immutable and validate themselves. Services are few, stateless, and named for activities. Associations have a direction and a purpose.

**Illustrative case:** In a subscription system, `Subscription` is an entity (identified by its own key, its plan and status change over time). `BillingPeriod` and `Price` are value objects (a start/end pair and an amount with currency, immutable). `ProrationCalculator` is a domain service because the rule spans a subscription, a price change, and a period and belongs to none of them.
