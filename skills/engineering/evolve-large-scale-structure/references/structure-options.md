# Structure options

## Layer names that recur

Treat these as starting points, not a template. Rename to fit the business, and keep to about five.

| Layer | Question it answers | Typical content |
| --- | --- | --- |
| Potential (capability) | What could we do? | Resources, capacity, contracts, how resources are organized |
| Operations | What are we doing? | Current activities and plans, the reality as it is |
| Commitment | What have we promised? | Agreements that direct future operations |
| Policy | What are the rules and goals? | Constraints, targets, eligibility |
| Decision support | What should we do? | Analysis, recommendations, optimization |

Businesses built on large fixed assets lean toward potential and operations. Businesses whose capacity comes from current commitments (insurance, finance) merge potential into operations and add commitment.

## Choosing and judging layers

- **Storytelling.** Do the layers say what the business cares about?
- **Dependency.** Do upper layers make sense against the lower, while the lower stand alone?
- **Contours.** Do layers separate things that change at different rates or for different reasons?

## Upward communication

A lower layer must not call upward. Let it publish events about state changes. Higher layers listen, evaluate rules, and respond or emit events for still higher layers.

```
Operations: part placed on wrong machine  --event-->  Policy: rule violated
Policy: action  ->  Decision support: choose repair or scrap
```

## Knowledge level in one picture

```
Knowledge level (edited rarely, by policy owners):  RoleType, RuleSet, PlanTemplate
Operations level (edited daily, by users):          Assignment, Order, Case
```

Operations objects obey the descriptions; descriptions refer to the types of operations objects. Dependencies run both ways, so this is not a layering.

## Signals to adopt

- Placement of new code is debated repeatedly.
- Users repurpose fields to fit unforeseen setups.
- Reviews keep finding the same kind of inconsistency across areas.

## Signals to drop or change

- Exceptions are common.
- Developers work around the structure.
- It forces awkward designs in the core.
- Nobody can state it in a few sentences.

## Minimalism

Prefer one or two simple rules over a full framework. Every added rule will get in someone's way; add it only if it pays for itself.
