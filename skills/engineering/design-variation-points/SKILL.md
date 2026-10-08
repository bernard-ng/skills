---
name: design-variation-points
description: Use when requirements mention future variants, plugins, extensibility, configurability, or "make it flexible", repeated changes touch the same behavior, a proposed abstraction is justified by flexibility, config flags are multiplying, or a change request might need a hook. Apply automatically to decide whether and where a variation point is justified, how much flexibility it needs, and how a new variant is added and verified.
---

# Design variation points

Software is not flexible by default, and flexibility costs extra design, extra code, and extra learning. Add it only where the need is real and the payoff is worth it. A design that merely reacts to change is not the same as one with prepared places for change.

## When flexibility is warranted

Emphasize it when it supports tangible requirements, does not compromise other goals, the software lives in a history of change or must fit several environments, and the value to stakeholders is high. Flexibility is rarely the real requirement; the need is to support particular changes, and flexibility is one design option. Be honest about affordability, and demonstrate the benefit before building it.

## Procedure

1. **Characterize the hot spot.** Write a short card: a name, a general description of what varies, and at least two concrete situations (see [hot-spot cards](references/hot-spot-card.md)). Ask what will change over time or work differently under some condition, and how flexible each case must be: at design time, install time, start-up, or run time; by a programmer or by an end user. Do not solve the variation on the card.
2. **Find the focus and scope.** Focus is the set of duties that directly support the variation. Scope is how much of the design it touches. Narrow focus with wide scope means the design needs reshaping: split a duty, reassign it, or add an object.
3. **Wait for evidence.** It is hard to tell how duties vary until you can compare several variations. Do not invent a flexible solution before testing it against at least three tangible examples.
4. **Choose the simplest sufficient mechanism.** In rising order of weight:
   - Change the code in one place when there is one variation and a narrow scope.
   - A parameter or a feature flag read from one small information holder that groups related settings (split it into smaller holders when it gets bulky).
   - Replace a collaborator through a shared role (strategy-like delegation).
   - Template and hook methods, where a base class fixes the steps and subclasses fill in the variable ones.
   - A placeholder object that will absorb duties as you learn more.
   - A full plug-in or framework contract.
   Techniques include enabling, replacing, augmenting, adding, or configuring a feature.
5. **Decide when it varies.** Check once at login, at start-up, when a setting changes, or while an operation is running. Dynamic changes need synchronization and rules for in-flight work; do not assume you need them. A restart is often an acceptable way to change a setting.
6. **Make it easy to extend.** Provide examples to copy, a single call that applies a set of related changes in the right order, a tool that checks settings, and a way to verify an adaptation did not break anything. A new variation should follow a documented procedure instead of requiring the developer to understand the whole design.
7. **Write a recipe** for whoever will make the change: name, intent, which roles and classes are involved, related recipes, numbered steps, and a discussion of problems and how to test. For end users, write interaction steps instead and say what limits exist. Write what the reader needs to know, not what you want to say.
8. **Changing a working system.** Characterize a proposed change (its focus, scope, and how well defined it is) before designing. If it is a one-off bolt-on, patch it; if it repeats a pattern of variation, refactor toward a flexible solution after the second or third time. Each patch on a patch makes the next change harder.

## Flexibility disease

Watch for overly complex procedures to extend, many conventions to remember, and extra code on both sides of a configurable interface. An inflexible design is not the cure; build flexibility only in the right places.

## Guardrails

Do not add hooks for one speculative case. Do not make a base class extensible without documenting the extension steps. Do not confuse a pattern with the variation itself. Do not delay a simple parameter in favor of a framework.

## Check

The design states what varies, who changes it and when, the cost of the mechanism, how a new variant is added, and how it is verified. The extension makes the actual next variation easier without imposing indirection on ordinary work.

**Illustrative card:** Hot spot "Choose a delivery channel": email, chat message, or print queue per customer. Chosen at account setup, changed rarely. Prepared as a small `DeliveryChannel` role and a preferences holder, not as a plug-in system.
