# Glossary

- **Router:** A category entry point that maps tasks to focused skills, currently `science-research-writing`, `responsibility-driven-design`, and `domain-driven-design`.

## Research writing

- **Move:** The communicative job of a sentence or paragraph, such as establishing context, stating a gap, or admitting a problem.
- **Move map:** A short plan listing the sequence of jobs a section must perform, written before drafting.
- **Move model:** The usual components and order of a section, learned from sample articles, with optional and repeatable components marked.
- **Target articles:** Three or four recent research articles from the target journal or field, used as evidence of its conventions.
- **Research map:** The short account of prior work in an Introduction that shows the key contributions and where the study sits.
- **Mapping:** The Discussion move that relates the study's results to the research map.
- **Claim strength:** How strongly a statement is asserted relative to its evidence.
- **Invisible error:** A grammatical sentence that does not say what the author meant, such as a wrong tense, article, or modifier scope.
- **Bare number:** A reported value with no frame or comment, so the reader supplies the interpretation.
- **Model-invoked skill:** A skill the agent can reach on its own because its description names its triggers.

## Object design

- **Role:** A coherent purpose and set of responsibilities an object can fulfill.
- **Responsibility:** An obligation to know, decide, or do something for collaborators.
- **Collaboration:** A request between roles to fulfill a larger responsibility.
- **Control center:** A part of the system where control and coordination decisions cluster.
- **Variation point:** A behavior or relationship intentionally designed to change in a specified way.
- **Hot spot:** A named place where behavior varies, described by what varies and at least two concrete situations.
- **Neighborhood:** A group of objects that work together on one problem and talk to the rest of the design through few, simple paths.
- **Role stereotype:** A deliberate oversimplification of an object's character: information holder, structurer, service provider, coordinator, controller, or interfacer.
- **Problem frame:** A class of problem (control, connection, information display, workpiece, transformation) with its own design questions.
- **Core, revealing, and ordinary design problems:** Parts that must be solved well, parts that teach something new each time they are worked on, and the rest.
- **Trust region:** A set of collaborators that can rely on each other's contracts; its edges validate what enters.

## Domain design

- **Ubiquitous language:** The single vocabulary used by domain experts and developers in conversation, documents, tests, and code.
- **Domain model:** A deliberately simplified, organized view of the parts of a business that matter for the software, expressed in code.
- **Entity:** A concept the business tracks individually over time, defined by identity rather than attributes.
- **Value object:** A small, immutable concept defined entirely by its attributes, with no identity.
- **Domain service:** A stateless operation named for a business activity that belongs to no single object.
- **Aggregate:** A cluster of objects treated as one unit for change, with a single root and one set of invariants.
- **Specification:** An object that answers whether a candidate meets a business rule, and can be combined with others.
- **Bounded context:** An area inside which one model and one language hold, owned by one team.
- **Context map:** The list of contexts and the named relationship on each link between them.
- **Anticorruption layer:** A translation boundary that keeps a foreign model from leaking into your own.
- **Core domain:** The small part of the model that differentiates the software and deserves the most design effort.
- **Generic subdomain:** A necessary part that any business needs and that carries no specialized knowledge.
- **Supple design:** A design whose parts reveal intent, isolate side effects, and recombine freely.
- **Large-scale structure:** A minimal set of rules or roles spanning the whole system that tells people where a part belongs.
