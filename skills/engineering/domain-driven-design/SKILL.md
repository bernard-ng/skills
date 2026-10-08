---
name: domain-driven-design
description: Use when a task involves a business domain with real rules and vocabulary, such as "model the domain", "domain model", "DDD", "entities and value objects", "aggregate", "bounded context", "core domain", "business logic is scattered across services", "anemic model", or before building a feature whose rules domain experts care about. Start here and apply automatically when domain concepts, model boundaries, or the shape of a domain layer must be decided.
---

# Domain-driven design

Software for a complicated business is only as good as the model of that business inside it. A domain model is a deliberately simplified, rigorously organized view of the parts of the business that matter for the task. The code is the model's working form, so a change in understanding is a change in the code, and a change in the code is a change in the model.

This router sits above the object-level skills. It decides *what the model is and where its edges are*. The object-level skills (`assign-object-responsibilities`, `place-objects-in-layers`, `apply-design-patterns`) decide how the pieces inside it divide work.

## Principles

1. **One model, shared by talk and code.** The words used by domain experts and developers are the names in the code. If experts would not recognize a class, method, or test name, fix the name or the model.
2. **Behavior and rules live in the domain layer.** Keep business rules out of screens, controllers, SQL, and glue. The domain layer should be readable by someone who knows the business and not the framework.
3. **Learn by building.** Understanding comes from conversations with experts, prototypes, and failed attempts. Treat the first model as a draft.
4. **Strategy before tactics.** Decide which part of the system deserves the most design effort and where model boundaries run before polishing individual classes.
5. **Invest where it differentiates.** Spend the best effort on the part of the model that makes the software worth building. Keep everything else plain, generic, or bought.
6. **Pragmatism over purity.** Simple data entry and reporting screens do not need a rich model. Match effort to complexity and stay inside the repository's existing language, framework, and conventions.

## Flow

1. Terms are fuzzy, disputed, or differ between people and code: call the Skill tool with `build-ubiquitous-language`.
2. Choose what each concept is (identity-bearing object, value, operation, grouping): call the Skill tool with `model-domain-building-blocks`.
3. Decide consistency boundaries, how objects are created, and how they are stored and found: call the Skill tool with `design-aggregates`.
4. A rule, constraint, process, or policy is hiding in conditionals or flags: call the Skill tool with `make-implicit-concepts-explicit`.
5. The model is correct but hard to use, combine, or test: call the Skill tool with `shape-supple-design`.
6. The model keeps needing special cases or feels shallow: call the Skill tool with `refactor-toward-deeper-insight`.
7. More than one model, team, legacy system, or vocabulary is in play: call the Skill tool with `map-bounded-contexts`.
8. Effort needs focusing, or generic work crowds out the business heart: call the Skill tool with `distill-core-domain`.
9. The system is too big to hold in one head: call the Skill tool with `evolve-large-scale-structure`.

Each call loads one skill, so make several calls when a step needs several. For a small local change, run only the skill whose signal matches. For a new or large system, do steps 7 and 8 before polishing steps 2 to 6.

## Signals that should fire a skill

| Signal in the request or code | Skill |
| --- | --- |
| Same word means two things, code and experts disagree, translation in conversation | `build-ubiquitous-language` |
| `UserData`, `OrderInfo`, record plus manager class, mutable shared value objects, "should this be a class or a function" | `model-domain-building-blocks` |
| Invariant spanning several objects, transaction too large, repository per table, constructors with long setup | `design-aggregates` |
| Status flags, `if` ladders about eligibility, validation scattered over layers, "the process" with no object | `make-implicit-concepts-explicit` |
| Hard-to-test methods, hidden side effects, objects that must be called in an order, tangled conceptual dependencies | `shape-supple-design` |
| Every new requirement adds a special case, domain experts keep correcting the model, a rewrite looms | `refactor-toward-deeper-insight` |
| Two teams sharing a model, legacy integration, one `Customer` for every use, translation layers | `map-bounded-contexts` |
| Large codebase with unclear value, generic code getting the best developers, build or buy decisions | `distill-core-domain` |
| Many modules, nobody knows where a thing goes, inconsistent solutions in each area | `evolve-large-scale-structure` |

## Reference material

- [Strategic assessment](references/strategic-assessment.md): the questions that give a project a starting position before any redesign.

## Guardrails

Do not apply the full toolkit to a CRUD form. Do not introduce aggregates, factories, or repositories because the vocabulary exists; introduce them when a stated problem needs them. Do not invent domain rules; ask, or mark an assumption. Do not let a tidy diagram stand in for talking to someone who knows the business. Do not impose a global model on parts that need their own.

## Output

A short domain brief: the terms that matter with agreed meanings, the concepts and their kinds, the consistency boundaries, the model boundaries and how they connect, what is core and what is supporting, the decisions and trade-offs made, and the open questions for domain experts.
