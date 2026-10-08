---
name: evolve-large-scale-structure
description: Use when a domain model has grown into many modules and nobody knows where new code belongs, when each area solves the same problem differently, when people need a shared way to describe the whole system, when configurable roles or rules tempt the model into endless flags, when plug-in components must interoperate, or the user asks for "architecture for the domain", "layers of responsibility", "system metaphor", "knowledge level", or "pluggable components". Apply automatically when modules multiply or consistency across areas starts to break down.
---

# Evolve a large-scale structure

Splitting a model into modules makes pieces understandable but not the whole. A large-scale structure is a small set of rules or roles that runs across the design, so people can say what a part does in the system and where a new thing belongs without learning every detail. It is optional, and a bad one is worse than none.

## Procedure

1. **Check that you need one.** Warning signs: many modules and no map, parallel solutions to the same problem, difficulty placing new code, and onboarding that takes too long. If modules plus a clear core are enough, stop.
2. **Start loose and let it grow.** Do not impose an architecture up front. Begin with a light device (a metaphor or two or three layers), apply it, and refine it as understanding deepens. Be willing to replace it with a different kind of structure. Each rule should make the work easier, or be dropped.
3. **Pick the lightest form that helps.**

   | Form | Fits when | Watch for |
   | --- | --- | --- |
   | **System metaphor** | A vivid analogy genuinely explains the whole system and guides decisions | Pulling in unwanted traits; drop it if it strains |
   | **Responsibility layers** | The domain has natural strata that change at different rates and depend one way | Too many layers (stay under about five); layers that do not tell the business story |
   | **Knowledge level** | Users or admins configure the roles, types, and rules that shape the working objects | Overgeneralizing; configuration that needs a programmer |
   | **Pluggable components** | Several mature applications share abstractions and need interchangeable parts | Freezing the abstract core; do not use it first or second |

4. **Responsibility layers: how.** Name broad responsibilities that tell the story of the domain, for example what the business *can* do (capabilities), what it *is doing* (operations), what it has *promised* (commitments), what *rules* apply (policy), and what it should *decide* (decision support). Allow each layer to depend on the ones below only. Move each module and aggregate wholly into one layer; refactor those that straddle two. When information must flow up (an exception on the floor, a threshold crossed), use events so lower layers stay unaware of higher ones.
5. **Knowledge level: how.** Separate objects that *describe* how others behave (types, rules, plans) from the objects that *do the work*. Allow edits to the descriptive objects only to people who set policy. Keep it specific to the domain, not a general reflection framework, and plan how existing working objects migrate when the descriptions change.
6. **Pluggable components: how.** Distill an abstract core of interfaces and interactions, publish it, and let independent components implement and plug into it. This requires deep, stable understanding of the domain, which usually comes after several applications exist.
7. **Put the language in play.** Add the structure's terms to the shared vocabulary (see `build-ubiquitous-language`) and use them in design talks and reviews. Flag exceptions so readers know when the rule is knowingly broken. If exceptions pile up, change the structure.
8. **Combine with strategy.** A structure can sit inside one context or span the whole map (see `map-bounded-contexts`). Place legacy and external systems explicitly in the structure, even if they span several layers. Let it sharpen the core (see `distill-core-domain`); the structure may itself be an important part of the core.
9. **Decide who evolves it.** The people building the applications discover it; a small group with hands-on experience maintains it and spreads it. It should reach every developer, absorb feedback quickly, avoid taking design decisions away from those with local knowledge, and stay minimal.

## Guardrails

Do not design an architecture before the problem is understood. Do not make the structure comprehensive. Do not use a structure to enforce uniformity in areas that need to differ. Do not write framework code for a structure until the rules are stable and used. Do not build tools for dummies; assume the people using the structure can design. Follow existing architecture decisions in the repository and propose changes through them.

## Check

A new person can predict which layer or component a feature belongs in. Dependencies follow the agreed direction. Exceptions are marked and few. The structure is described in a few sentences and used in conversation.

**Illustrative case:** A logistics model has forty modules. The team proposes three layers: `Fleet` (what assets exist and what they can do), `Operations` (what is currently running), and `Planning` (what to do next). A `PreferredCarrier` flag on a vehicle belongs to planning, so it moves out into a planning policy that the planner consults; vehicles stay unaware of planning. New modules now declare their layer, and the reviewer's first question is "which layer?".

## Reference material

- [Structure options](references/structure-options.md): layer names that recur across domains, signals to adopt or abandon a structure, and the rules for events between layers.
