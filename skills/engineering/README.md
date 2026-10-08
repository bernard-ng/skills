# Engineering skills

26 skills for responsibility-driven object design and domain-driven design. Every skill here is **model-invoked**: its description names the requests and code signals that should fire it, so the agent reaches for it without being asked. You can also name a skill directly.

Two routers open the set. [responsibility-driven-design](responsibility-driven-design/SKILL.md) holds the flow and signals (a god class, a type switch, a catch-and-log, a "make it extensible" request) for object design. [domain-driven-design](domain-driven-design/SKILL.md) does the same for domain modeling (shared language, aggregates, hidden rules, bounded contexts, core focus). Each skill has a human-facing page under [docs/engineering](../../docs/engineering/responsibility-driven-design.md).

The skills are language-neutral. A role may become a class, interface, function, or module, and existing frameworks and conventions win over a clean-sheet design. They do not require UML, cards, or any pattern.

**Model-invoked**

### Orchestration

- **[responsibility-driven-design](responsibility-driven-design/SKILL.md)**: The router. Design from behavior to roles, duties, and collaborations, and send each decision to the right specialist.
- **[frame-design-problem](frame-design-problem/SKILL.md)**: Write a short design story, find themes, constraints, and problem frames, and decide what is core before choosing objects.

### Finding and shaping objects

- **[discover-object-roles](discover-object-roles/SKILL.md)**: Find candidate roles from themes and machinery, describe them, and defend or drop them before assigning duties.
- **[name-design-objects](name-design-objects/SKILL.md)**: Choose names that reveal role, fit a scheme, avoid overload and vague words, and carry a clear definition.
- **[define-shared-roles](define-shared-roles/SKILL.md)**: Find what candidates share, decide interface, abstract class, or concrete class, and prefer polymorphism to type checks.
- **[assign-object-responsibilities](assign-object-responsibilities/SKILL.md)**: Derive duties from behavior, place them with coherent roles, and rebalance overgrown or anemic objects.

### Collaboration and control

- **[trace-object-collaborations](trace-object-collaborations/SKILL.md)**: Simulate a scenario as requests among roles to find gaps, missing objects, and unexplained handoffs.
- **[design-object-connections](design-object-connections/SKILL.md)**: Decide how collaborators obtain references, limit coupling and Demeter-style reach-through, and replace primitives with concepts.
- **[choose-control-style](choose-control-style/SKILL.md)**: Compare centralized, clustered, delegated, and dispersed control for a workflow and keep similar workflows consistent.
- **[place-objects-in-layers](place-objects-in-layers/SKILL.md)**: Place roles in layers or a framework style, keep message flow and trust edges clear, and give neighborhoods one front door.
- **[apply-design-patterns](apply-design-patterns/SKILL.md)**: Weigh a pattern problem, forces, and consequences against a plain alternative, and adapt it to local roles.

### Hardening

- **[design-reliable-collaborations](design-reliable-collaborations/SKILL.md)**: Assign detection, recovery, contracts, and outcomes across collaborators, scaled to what failure costs.
- **[design-variation-points](design-variation-points/SKILL.md)**: Justify and design flexibility from concrete variations, using the simplest sufficient mechanism and a recipe to extend.

### Review and communication

- **[review-object-design](review-object-design/SKILL.md)**: Review roles, duties, and collaborations for coherence, coupling, and consistency, and propose concrete moves.
- **[describe-object-collaborations](describe-object-collaborations/SKILL.md)**: Choose what to show, at which level, and in which form to explain how objects cooperate.
- **[solve-revealing-design-problems](solve-revealing-design-problems/SKILL.md)**: Separate core, revealing, and ordinary work, vary hard problems instead of repeating attempts, and accept limits.

### Domain-driven design

- **[domain-driven-design](domain-driven-design/SKILL.md)**: Domain model router. Decide the model, its boundaries, and where design effort goes, and send each decision to the right specialist.
- **[build-ubiquitous-language](build-ubiquitous-language/SKILL.md)**: Turn real domain sentences into one agreed vocabulary, resolve conflicting terms, and put it into names and tests.
- **[model-domain-building-blocks](model-domain-building-blocks/SKILL.md)**: Decide whether each domain concept is an entity, value object, service, or module, and simplify its associations.
- **[design-aggregates](design-aggregates/SKILL.md)**: Draw consistency boundaries around invariants, choose roots, and design factories and repositories to match.
- **[make-implicit-concepts-explicit](make-implicit-concepts-explicit/SKILL.md)**: Give hidden rules, constraints, processes, and policies their own named objects.
- **[shape-supple-design](shape-supple-design/SKILL.md)**: Make domain interfaces reveal intent, isolate side effects, state their contracts, and follow the contours of change.
- **[refactor-toward-deeper-insight](refactor-toward-deeper-insight/SKILL.md)**: Treat repeated strain as a clue to a missing concept, explore alternatives with experts, and reshape the model.
- **[map-bounded-contexts](map-bounded-contexts/SKILL.md)**: Bound each model, name how contexts relate, and translate at the edges.
- **[distill-core-domain](distill-core-domain/SKILL.md)**: Name the core, separate generic subdomains and mechanisms, and aim effort at what makes the software worth building.
- **[evolve-large-scale-structure](evolve-large-scale-structure/SKILL.md)**: Find a minimal structure, such as responsibility layers, that lets people place and understand parts of a large model.
