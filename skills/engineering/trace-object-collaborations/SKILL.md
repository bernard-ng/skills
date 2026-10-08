---
name: trace-object-collaborations
description: Use when a use case crosses several objects, a client sends many low-level messages, handoffs or who-calls-whom are unclear, a design is about to be coded without a walkthrough, or the user asks to "walk through the scenario", "role-play the design", "simulate", or "draw the sequence". Apply automatically to test candidate roles and duties against a concrete scenario before or during implementation, and to find missing objects and duties.
---

# Trace object collaborations

Collaboration is one object asking another for something it needs. Simulate a concrete task as requests among roles, with nothing but cards, notes, or a short text trace. This finds missing objects, vague duties, and unexplained handoffs before any code exists. The notation is not the goal.

## Plan the simulation

1. **Pick the hard parts.** Choose a use case, key event, or area where understanding is rough. Not everything is worth simulating, and anything you already understand is not.
2. **Set a goal and boundaries.** Examples: test the control pattern, find what you do not know, explore one small area, find natural neighborhoods, rewrite vague duties. Decide which objects and duties are in and out. Stay at one level of detail.
3. **Choose the scenario.** Start from a scenario or conversation with step-by-step actions, and start where the use case starts. Add one consequential branch or failure.
4. **Time-box it.** More than about an hour usually means the scope is too big or you are doing design inside the simulation.

## Run it

1. **Start with an event** expressed as an intention ("the customer confirms the order"), not a UI gesture. Ask which object is told, which of its duties applies, and whom it works with. If no card or duty exists, make one. If the role does not fit, change the role or pick another object.
2. **Follow the work request by request.** For each handoff state the sender's intention, the receiver's responsibility, the information passed, the response, and how the sender can see the receiver. If a role cannot explain its part, you have found a gap.
3. **Invent controllers when needed.** Use cases usually need something that listens to the event and delegates. Start with one. If it ends up doing too much, break its work up and delegate more.
4. **Be a skeptic.** When an object responds, ask what information it needed and where it came from. When a message is sent, ask where the sender got the receiver. Know the five ways to hold a reference: it is a field, it arrived as an argument, it came back from an earlier request, it was created on the spot, or it is widely visible. Defer this question until most paths are settled, but do not leave it undecided.
5. **Keep the cards honest.** Check each received request against the receiver's duties; reword duties when work moves; add collaborators you discover; write new cards for new roles.
6. **Record what you do not know** and keep going. Do not settle everything in one pass.
7. **Look at the shape.** Count how many objects each collaborates with. Hubs bloat with duties. Objects every other object can see make their public duties costly to change. Check the paths for consistency.

## Improve it

- Many low-level messages from a client: bundle them into an intention-level request with reasonable defaults.
- Too many outside connections to a neighborhood: consider a single entry point (see `design-object-connections`).
- Branching on kind: give the kinds a shared role (see `define-shared-roles`, `choose-control-style`).
- Primitive values passed around: see `design-object-connections`.
- Failure paths: call the Skill tool with `design-reliable-collaborations`.

## Strategies for finding collaborators

Per stereotype, ask what each object needs from neighbors and offers them: holders ask where facts come from, structurers where members come from, providers who has their inputs, controllers who has the facts for their decisions, coordinators how they reach workers, interfacers what to do when a connection fails. For a single duty, ask who has the missing information or who can do the missing step. For a large duty, split it into steps and a sequencing duty. For architecture, remember that a layered design limits who talks to whom.

## Guardrails

Do not draw a diagram for every path. Do not model UI details when the question is behavior. Do not invent message arguments you have not decided; precision should match knowledge. Stop when the model is "good enough": objects interact consistently, natural divisions are preserved, and the hard places have been explored.

## Check

The trace reaches its outcome. Each request names an actual duty. Collaborator visibility is plausible. No unexplained transfer of control or data remains. The cards or notes match what happened.
