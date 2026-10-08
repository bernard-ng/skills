---
name: discover-object-roles
description: Use when a feature has unclear objects or classes, a domain model just turns nouns into classes, a proposed class has no clear purpose, a service or module boundary is being drawn, or the user asks "what classes do I need", "find the objects", "model this domain", or "sketch CRC cards". Apply automatically after the problem is framed and before duties are assigned, to find, describe, and defend candidate roles instead of coding the first nouns.
---

# Discover object roles

Find candidates that deserve to exist, then justify them. Real-world things are only candidates: the design also needs invented objects for services, decisions, coordination, structure, and interfaces. Look for roles first and decide classes later.

## Procedure

1. **Start from the story.** Use the design story and themes (call the Skill tool with `frame-design-problem` if they do not exist). Search each theme from these perspectives, moving on from any that yield nothing:
   - The work the system performs.
   - Things it touches or depends on: other software, devices, outside systems.
   - Information that flows through it.
   - Decisions, control, and coordination.
   - Structures and groups of objects.
   - Real-world things it needs to know about.
2. **Match search to stereotype.** Computation-heavy work suggests service providers and algorithm objects. Moving information suggests holders plus coordinators. Outside systems suggest interfacers at the border. Sorting and relating suggests structurers. Almost every design needs something to control or coordinate. See [role stereotypes](../responsibility-driven-design/references/role-stereotypes.md).
3. **Handle the border deliberately.** Model connections to other systems as interfacers. Model a user only when who they are changes behavior (access rights, resumable sessions); otherwise let a user interface object convey their actions.
4. **Add machinery.** Look for the startup object, scarce-resource managers, configuration holders, brokers that supply collaborators, and objects that structure or translate. These rarely appear in the domain.
5. **Think concretely first.** Name specific objects with clear roles before generalizing. Only after you see several concrete candidates and their common duties should you define shared roles (call the Skill tool with `define-shared-roles`).
6. **Describe each candidate.** Name it (call the Skill tool with `name-design-objects`), write a one- or two-sentence purpose, mark its stereotype, and add one distinguishing fact: what it works with, what is interesting about it. Say what it is and what it is not. Start from a standard meaning if one fits, then add what is specific to this system.
7. **Characterize it.** Note its work habits (self-directed or told what to do, busy or idle), relationships, common obligations, place in the architecture, and level of abstraction. Do not assign duties yet.
8. **Compare and cluster.** Merge candidates whose purposes overlap, distinguish those that behave differently, and group them into neighborhoods by use case, layer, theme, or stereotype. A distinction that matters in the world may not matter to the software.
9. **Defend or drop.** Keep a candidate on the accepted list when you can name it well, define it, give it a stereotype, tie it to a use case or architectural need, give it one or two first duties, see how others view it, and tell it apart from similar candidates. Drop it if it overlaps a better one, is vague, lies outside the boundary, adds no value, or is too clever for the need. Put the uncertain ones on a deferred list.
10. **Stop when discovery slows.** Twenty to fifty candidates is plausible for a sizable design. More will be invented while assigning duties.

## Guardrails

A noun list is not a design. Do not model a real-world distinction (checking account, savings account) the software never acts on. Do not build an inheritance hierarchy at this stage. Do not accept a candidate because its name is neat. Candidates that are no good are cheap to toss now.

## Check

Every accepted role has a purpose, a plausible client or scenario, and a clear difference from its neighbors. The design contains invented objects as well as domain concepts. Next call the Skill tool with `assign-object-responsibilities`.

**Illustrative cards:** "ReportScheduler: a coordinator that starts nightly jobs and reacts to completion; works with the job queue." "RendererPool: a service provider that lends a limited number of renderers to jobs." "CustomerReportPreferences: an information holder that knows a customer's formats and channels."
