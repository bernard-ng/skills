---
name: design-object-connections
description: Use when objects reach through other objects (a.b().c().d()), a client sends a stream of tiny requests, raw strings and numbers are passed between collaborators, a constructor or global is used to find a helper, many outsiders call into one neighborhood, or the user asks about coupling, the Law of Demeter, dependency injection, or how objects get references. Apply automatically when deciding how collaborators find and talk to each other.
---

# Design object connections

A collaboration has two sides: the behavior (who asks whom for what) and the structure that makes it possible (how the caller got a reference, and for how long). A design is not finished until every collaboration has an answer for the second side. Aim for few, well-chosen visibilities that limit coupling without forcing structurers to do all the work.

## Procedure

1. **List the references.** For each collaboration decide how many collaborators an object needs, how it refers to each, and how long it keeps the reference.
2. **Get a collaborator the simple way.** The language supports a few schemes: create it, receive it as an argument, take it from the result of an earlier request, hold it in a field, or reach it through a widely visible object. Create a helper when needed; keep it when it is used repeatedly or expensive to recreate; discard it when the responsibility is done.
3. **Choose the scope of a held reference.** Per instance if one object needs its own helper; shared by all instances if they need the same one; widely visible only when different kinds of objects need it. Treat widely visible references as a coupling cost.
4. **Ask for a service, not a class.** When flexibility matters, ask a known broker for help by the kind of help needed instead of constructing a concrete helper. That lets the provider and its management change without touching clients. Introduce the broker only when you need the freedom.
5. **Treat the Law of Demeter as a guideline.** Do not dig into a structurer for a subpart and then call the subpart. Prefer asking the enclosing object, which takes on the duty of passing the request along, when its structure should stay private. But if there are few links to chase, forcing every deep detail into the structurer only moves knowledge and bloats it. Judge case by case: hide structure that may change, expose structure that clients legitimately use.
6. **Bundle low-level requests.** If a client sends a stream of small requests to set up a provider and then ask for a result, offer a higher-level request with reasonable defaults.
7. **Use real concepts in place of primitives.** If you are passing strings and numbers around, ask what they mean (money, quantity, range, phone number). A small object gives overlooked duties a home (currency conversion cannot live on a float) and removes repeated checks.
8. **Give a neighborhood one front door.** If too many outsiders reach into many objects, add an internal interfacer (a facade) that knows which inside object handles each request and forwards it. Keep it simple: it should not make decisions about who should receive a request or translate requests into long sequences, or it becomes a controller.
9. **Watch the autonomy trade-off.** An object that collaborates must know its neighbors; an object that is reusable must depend on few. Make decisions that limit unnecessary dependencies and avoid making objects that fit only one neighborhood.
10. **Keep the big picture.** Look for hubs that many objects ask for everything, objects that know about many others, and objects that flow through the system and become visible to everyone.

## Guardrails

Do not apply any rule mechanically. Do not introduce a broker, facade, or injection framework until a real variation or coupling problem exists. Do not hide a structure that clients legitimately iterate. Do not duplicate the same information in several objects to avoid a call.

## Check

Every collaboration has a known source of the reference and a known lifetime. No client depends on the internal structure of something it should treat as a unit. Collaborations that cross a neighborhood go through few, simple paths.

**Illustrative change:** Replace `order.getCustomer().getAddress().getCity()` and a chain of setters with `order.shippingCity()` and a `ShippingQuote` request that carries a `Money` and a `Weight`, not three loose numbers.
