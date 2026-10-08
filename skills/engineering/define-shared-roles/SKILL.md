---
name: define-shared-roles
description: Use when several classes or candidates look alike, a client branches on the kind of object it holds, one interface should serve many implementations, inheritance is proposed to share code, a candidate must fit a framework as well as the domain, or the user asks "should this be an interface or abstract class". Apply automatically when mapping roles to classes and interfaces, and when objects could be used interchangeably.
---

# Define shared roles

A role is a set of responsibilities that interchangeable objects can fulfill. Finding what candidates have in common simplifies a design, makes it consistent, and lets collaborators ignore differences. Decide roles first, then how they become classes, interfaces, or functions.

## Procedure

1. **Gather concrete candidates first.** Abstraction comes after you understand several concrete cases and their individual duties.
2. **Look for shared duties.** Compare candidates' responsibilities. If many candidates share some, define a shared role with a clear purpose and those duties, and let collaborators treat all of them alike. Compare at least three cases; two is too few to see what really varies.
3. **Check the test.** A category earns its place only if it can define common responsibilities for its members. If different kinds behave differently in your software, keep the distinct candidates. If their differences do not matter to your software (the real world distinguishes them, you do not), blur them and keep one candidate with a kind attribute.
4. **Look below the surface.** Responsibilities that sound alike may mean different things to clients or need different signatures. Sort them: common and implemented identically, common but implemented differently, and apparently common but not really the same.
5. **Discard what a shared role replaces.** If a shared role covers a candidate fully, drop it. Do not keep a family of near-identical candidates that differ only in minor variations.
6. **Choose the realization.**
   - **Interface:** when a role may be played by objects of different kinds, including ones that do not share an ancestor. Declare it even if you only plan one hierarchy now, so clients depend on the role and not on a class family.
   - **Abstract class:** when members share partial behavior; use it to hold the shared implementation and leave the rest to subclasses.
   - **Concrete class:** one candidate with one primary role and a complete implementation. Mapping one candidate to one class is the normal, simplest case.
   - **Function, closure, or module:** if the role has one responsibility and your language prefers it.
7. **Account for secondary roles.** An object has a primary role (its purpose) and may take on secondary roles that let it fit a technical library or framework (persistence, lifecycle, lookup). Add secondary roles after the application-specific design is stable, and say which is which. Some secondary roles are domain-wide (a candidate may be a kind of "financial asset" as well as a "bank account").
8. **Prefer polymorphism to type checks.** If a client asks what kind of thing it holds and branches, give the kinds a shared role with the behavior and let each do the right thing. See `choose-control-style` and `apply-design-patterns` for the double-dispatch variant when the choice depends on two kinds.
9. **Choose composition or inheritance deliberately.** Composition is dynamic: objects plug together and can be swapped at run time. Inheritance is static: subclasses merge with their superclass when written, and it commits you to one hierarchy. Use inheritance for a real "is a kind of" with shared duties, and prefer composition and delegation to reuse code or vary behavior.

## Guardrails

Do not create a shared role for two objects that happen to have a method name in common. Do not use a deep hierarchy to share code. Do not generalize beyond what you can write a good definition for.

## Check

Can you write a purpose and a short list of duties for the role that every member honors? Can a collaborator use any member without asking its kind? Next call the Skill tool with `design-object-connections` if the role changes how objects find each other.

**Illustrative case:** An export service has PDF, spreadsheet, and web exporters. They share "render a report to a destination", so define one role and let the scheduler call it. Add per-format options inside each, not in the scheduler.
