---
name: choose-control-style
description: Use when event handling or workflow code has a large controller, many tiny handlers, long if-else or switch chains on type or state, a coordinator that knows every detail, repeated decision logic, or decision ownership is unclear, or the user asks "where should this decision be made", "should this be one orchestrator", or "refactor this state machine". Apply automatically when choosing centralized, clustered, delegated, or dispersed control will change object responsibilities.
---

# Choose control style

Control style is how decision making and coordination are spread across a control center and its collaborators. Judge one workflow at a time, not the whole system. There are only a few options, along a continuum, and none is a universal default.

## The options

- **Centralized:** one controller makes most decisions and the objects around it are told what to do. Decisions are easy to find. Risks: complex branching, the controller depending on the contents of holders, indirect coupling through the controller, and all the interesting work in one place.
- **Clustered:** decisions are split among several controllers (for example, one per state), each handling a small part of the control. It simplifies the controller but keeps the decisions in the control center.
- **Delegated:** controllers decide what should be done and push decisions and action out to capable collaborators. Coordinators know fewer objects, requests are higher level, changes affect fewer objects, and work is easier to divide. Risks: weak objects with nothing to do, small one-client providers, awkward collaborations when delegated requests carry too little context, and lots of collaborations for little work.
- **Dispersed:** every object holds a piece and no center exists. It is hard to find where something is decided and who is responsible.

Most designs sit between centralized and delegated. Simple, regular decisions may stay central; work that splits into parts with different meanings suits delegation.

## Procedure

1. **Identify the control centers.** They sit where a consistent pattern of collaboration is needed: user-initiated events, complex processes, the work inside a neighborhood, external software your system drives. Do one at a time.
2. **Trace a representative event.** Mark every decision, state change, action, and source of information. Name the current center and any other centers it must coordinate with. Do not equate the number of events with complexity; the number of different responses to the same event is what matters.
3. **Try one distribution.** Count what the center must know and do, how many kinds of objects it touches, and how complex its decisions are. Compare with a second option. If it is a framework, go with the flow of the framework's style (a listener per widget, a request pipeline) and only decide what each handler does next.
4. **Simplify central logic before leaving it.** If decisions are based on ranges or related facts, factor them into helpers that answer yes or no, and order tests by how often they apply. A state machine with discrete, deterministic states can be pushed into state objects or into methods named for each state; compare both.
5. **Push decisions toward the owner of the facts.** If an object controls what to do with what a collaborator holds, move the decision to the collaborator. If the controller picks among many low-level objects, hide that choice inside a new object that answers the question. If the behavior depends on the kind of thing selected, give the kinds a shared role and let each do the right thing (polymorphism), which removes the decision altogether. See `define-shared-roles`.
6. **Do not adopt a pattern as the solution.** State, strategy, and command are options. Taking a pattern off the shelf means taking its distribution of duties; check that it matches your goals and that you have not stopped looking for a better one. See `apply-design-patterns`.
7. **Be consistent.** Similar workflows should work alike. When designing a second control center, check whether the same roles are involved, whether duties for action are separate from duties for information, whether stereotypes are similar, and whether common abstractions can unify different-looking objects. If objects are too different, do not force the same mold.
8. **Retest.** Walk the same scenario and one alternate state through the new design. Note which roles changed, where the next case would go, and what became harder to understand. See `trace-object-collaborations`.

## Guardrails

Do not push everything out of a controller just to make it small; that leaves weak objects. Do not accept a central design just because it is easy to find. Do not mix styles unconsciously inside one center. Do not delete a legitimate framework hook to fit a style.

## Check

Decision ownership is explicit. The control center has a coherent job. Adding the next expected case has a clear path. Similar workflows follow similar patterns.

**Illustrative move:** A `CheckoutController` checks the payment kind and branches. Give `CardPayment`, `InvoicePayment`, and `VoucherPayment` a shared role with `authorize`, and let the controller only sequence authorize, reserve, and confirm.
