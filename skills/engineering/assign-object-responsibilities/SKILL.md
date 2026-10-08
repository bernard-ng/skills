---
name: assign-object-responsibilities
description: Use when a class does too much, a service or controller gathers data from passive objects and decides everything, behavior is spread across data holders and helpers, a duty has no obvious owner, or the user asks "where should this logic live", "who is responsible for", or "this class is too big". Apply automatically when use cases must be turned into duties and when duties need to be placed, rebalanced, or tested for coherence.
---

# Assign object responsibilities

A responsibility is a general statement of something an object knows, does, or decides for others. Derive duties from behavior, then place them where they fit and test that each object stays in character. The first assignment is provisional until a scenario tests it.

## Find the responsibilities

- **From behavior descriptions.** Turn use cases and scenarios into duties in three steps: find what the system does and what information it manages, restate each as a responsibility, split broad ones into smaller parts. Use cases leave out control, coordination, error detection, display, timing, and synchronization, so add those.
- **From gaps.** Ask "what if... then... and how?" Questions about states, timing, rules, and recovery expose duties. Tag the questions that will change the design most; keep working with assumptions.
- **From the design story.** Phrases that demand action in the story imply duties; note where each leads.
- **From stereotype.** Holders answer questions, providers handle requests, structurers manage relationships and answer questions about them, interfacers translate, coordinators manage cooperative work, controllers field events and direct others. See [role stereotypes](../responsibility-driven-design/references/role-stereotypes.md).
- **From relationships.** A structurer needs duties for what it structures. Decide which side of a relationship owns what; often neither object should, and a new structurer should.
- **From life events.** Creation, important events, and end of life carry duties (cleanup, reacting to a timer or message).
- **From the technical environment.** Frameworks and libraries impose duties (equality, lifecycle, persistence). Plan for them, but do not start with them.

## Place them

1. Start with the high-impact objects: those in the architecture's middle, widely visible, central to the domain, making decisions for others, or complex. Cluster by domain concept, use case, theme, or boundary.
2. State each duty broadly, above the level of individual attributes and methods ("knows how the customer prefers to be addressed", not "knows nickname"). Use strong verbs where you can (credit, merge, calculate, register) over weak ones (process, handle, manage), unless the weak word has a precise meaning in the domain. See [responsibility notes](references/responsibility-notes.md).
3. Separate public duties (what clients get) from private duties (what supports them), and settle public ones first.
4. For a complex duty compare three options: do all the work, ask others for parts, or delegate the whole request. If it is too big for one object, split it into the major steps plus one duty that sequences them, at one level of detail, and assign each step.
5. Keep behavior with the information it uses. Give a holder the duties to compute and check what it holds, so controllers need not interrogate it. Keep information about one thing in one place; if two objects need it, create a sole repository, give it to the object that fits, or merge them.
6. Distribute intelligence, but do not make the control objects too clever. Give collaborators as much responsibility as they can handle.
7. Do not overlap duties. Decide who checks, guarantees, or ensures each thing and relieve others of it.
8. When stuck, use the tactics in [responsibility notes](references/responsibility-notes.md): break the duty down, ask for a specific meaning, make an arbitrary assignment and walk it through, or invent a new candidate.

## Test the result

- Does the object stick to its purpose? Are duties clearly stated? Do they match its role stereotype? Does it add value for its neighbors?
- Does it take on duties that go beyond its intent (a person who knows every pet, vehicle, and policy)? Move non-intrinsic relationships into new structurers.
- Do lower-level, more reusable objects depend on higher-level ones? A temperature should not know about a measurement.
- Are there tiny one-client service objects or giant controllers? Merge the first into their client; split or redistribute the second.

Then map roles to code: one candidate with one primary role is one class (or function) in the normal case; add secondary roles later (see `define-shared-roles`).

## Guardrails

A responsibility is not an attribute or an implementation. "Knows its tax" may be a stored field, a derivation, or a call to a calculator; leave that open. Do not pad duties to avoid a collaborator. Do not assign by getter and setter.

## Check

Each important system action has one clear owner. Each role's duties are coherent. Unassigned duties and open policy choices are visible. Next call the Skill tool with `trace-object-collaborations` to test them in a scenario.
