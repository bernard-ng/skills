---
name: place-objects-in-layers
description: Use when deciding where objects belong in a layered, hexagonal, pipeline, or framework-driven architecture, when a framework dictates control flow or hooks, when UI, application, domain, and technical code are mixed, when dependencies point the wrong way, or the user asks about "layers", "ports and adapters", "service layer", "inversion of control", or "where does this go". Apply automatically when an architectural style constrains collaborations or object roles.
---

# Place objects in layers

An architecture is a set of behaviors and the assumptions each part may make about its neighbors, not a box-and-line picture. At architectural level the interfaces and expectations must tell it all. Choose styles for the qualities you need, then place roles consistently within them.

## Procedure

1. **Name the qualities that matter.** Usability, availability, security, performance, maintainability, flexibility, portability. Styles do not guarantee them but leave the opportunity open. Most systems need a mix of component interaction styles (layered, pipes and filters, blackboard) and control styles (see `choose-control-style`).
2. **Pick the views you need.** One description never tells the whole story. Useful ones are conceptual structure, control flow, components and subsystems, objects and interactions, and distribution. Choose which to document; record the patterns of collaboration and the client-server contracts along with the structure.
3. **Place roles in layers.** A typical information system has four:
   - Presentation: user interfacers and widgets.
   - Application services: coordinators and controllers that interpret events and sequence work.
   - Domain: holders, providers, structurers, domain controllers, and the rules.
   - Technical services: interfacers to devices, databases, networks, and outside systems.
4. **Keep the traffic rules.** Objects collaborate mostly within their layer. Across layers, clients are usually above servers, requests flow down, and results flow up. When information must flow up, use an event or notification mechanism so lower layers stay loosely coupled to upper ones. Only the top and bottom layers touch the outside world.
5. **Respect the framework's style.** A framework supplies a control style and a set of hooks, so your code plugs in and is called. Implement the hooks the way the framework dictates, and put your own decisions inside them. Do not fight the flow; a single fork or custom control scheme costs more than it returns.
6. **Give each neighborhood one entry point.** A service or gatekeeper (an internal interfacer) can represent a neighborhood and hide the objects inside. Distributed designs often add a broker or proxy so components locate and call remote services without knowing their location.
7. **Treat layer edges as trust edges.** Validation, authorization, and defensive checks belong where information enters a trust region. Trusted collaboration inside a region can be lean. See `design-reliable-collaborations`.
8. **Package for replacement.** A component packages several services behind a well-defined interface and can be updated or swapped. Use it when medium-sized reuse or replacement is a real need.

## Guardrails

Do not treat a layer diagram as the design. Do not push domain logic into the presentation or application layer because it is closest to the request, or technical details into the domain. Do not skip layers without a reason. Do not add layers or components that no quality requires.

## Check

Each layer's job is clear. Dependencies and message flow follow the agreed direction. Cross-layer requests go through known entry points. Framework hooks hold only what they must.

**Illustrative placement:** A web controller (presentation) forwards a "place order" intention to an `OrderCoordinator` (application), which asks `Order` and `Inventory` (domain) to act, and a `PaymentGateway` interfacer (technical) to charge. Errors from the gateway are recast before they reach the controller.
