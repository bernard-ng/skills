---
name: map-bounded-contexts
description: Use when more than one model, team, service, or legacy system shares a domain, when one concept such as Customer or Product means different things in different places, when a shared database or shared library couples teams, when integrating with an external or legacy system, when splitting a monolith or merging systems, or the user asks about "bounded context", "context map", "anticorruption layer", "microservice boundaries", or "integration". Apply automatically when a model is about to cross a team or system boundary.
---

# Map bounded contexts

A single model cannot serve everyone. As teams, uses, and systems multiply, the same word picks up different meanings and rules, and one unified model becomes bloated and contradictory. Instead, draw explicit **bounded contexts**: areas inside which one model holds, one language is consistent, and one team owns the rules. Then name how contexts relate.

## Procedure

1. **Find the real contexts.** Look for places where the same word means different things, where different teams change the code for different reasons, where rules contradict, or where an external system has its own model. A context is defined by language and ownership, not by deployment unit or folder. Start from what exists, even if messy.
2. **Name and bound each.** Give each context a name that people will use in conversation. Write down: the team that owns it, the key terms and what they mean here, what is inside, and what is outside. Keep the model inside consistent and unambiguous.
3. **Protect the boundary.** Inside a context, keep the model unified: one meaning per term, one team, frequent integration and tests so the model does not fragment. Do not leak other contexts' terms into it, and do not let a shared table or library quietly merge two models.
4. **Draw the map.** List each context and each connection between them. For every connection, name the relationship, who depends on whom, and what is exchanged. Map reality first, including the ugly parts; then propose changes.
5. **Choose the relationship for each link.**

   | Relationship | Use when |
   | --- | --- |
   | **Shared kernel** | Two closely coordinated teams share a small, explicitly owned part of the model; changes need agreement and shared tests |
   | **Customer/supplier** | One side depends on the other and the upstream team plans for downstream needs; use automated acceptance tests agreed by both |
   | **Conformist** | The upstream will not adapt and its model is good enough; the downstream adopts it as is |
   | **Anticorruption layer** | The upstream model is foreign or poor, and the downstream must keep its own model clean |
   | **Open host service** | One context serves many consumers through a published protocol; extend it for common needs |
   | **Published language** | A shared, documented exchange format (schema, event contract) so contexts need no translators of each other's model |
   | **Separate ways** | Integration costs more than it returns; the contexts do not connect |

   Choose by what the relationship costs and whether the teams can actually coordinate.
6. **Build translation at the edge.** An anticorruption layer is a facade (a simplified interface to the foreign system), an adapter (converts calls), and a translator (maps concepts between the models). Keep it narrow and in the downstream context. The domain code never sees the foreign shape.
7. **Decide on change.** Merge contexts only when the team and language truly unite. Split a context when two meanings fight. Phase out a legacy by wrapping it behind an anticorruption layer, moving functions one at a time, and retiring pieces. Do not attempt a big-bang rewrite without a boundary.
8. **Keep the map honest.** Revisit it when teams, vocabulary, or systems change. A stale map is worse than none.

## Guardrails

Do not equate contexts with microservices or repositories; a context can live in one process, and a service can span two contexts. Do not impose a single enterprise model. Do not draw an idealized map that hides actual dependencies. Do not add an anticorruption layer for a friendly, stable upstream. Respect organizational reality: relationships that need cooperation from a team that will not cooperate will not hold.

## Check

Each context has a name, owner, and consistent vocabulary. Every connection has a named relationship, direction, and contract. Foreign models do not appear in the domain code. A new engineer can tell which model applies where.

**Illustrative case:** A retailer's "Product" means a stocked item to warehouse staff, a listing with photos and copy to merchandising, and a billable line to finance. Instead of one `Product` class, there are three contexts, each with its own model keyed by a shared SKU. Merchandising publishes a `ProductListed` event in a documented schema (published language); warehouse and finance consume it through thin translators, and a legacy ERP is reached only through an anticorruption layer owned by finance.

## Reference material

- [Context relationships](references/context-relationships.md): a map format and what to write for each link.
