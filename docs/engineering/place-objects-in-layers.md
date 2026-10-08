## What it does

Places roles in layers or a framework's style, keeps request and result flow and trust edges clear, and gives each neighborhood one entry point.

It treats an architecture as behaviors and assumptions, not a box-and-line picture.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a framework dictates control flow or when presentation, application, domain, and technical code are mixed.

## Common questions

**Can I ignore the framework's style?**
Rarely. Go with its flow and put your decisions inside its hooks.

## It's working if

- Dependencies and message flow follow one direction and cross layers at known entry points.

## Where it fits

Works with [choose-control-style](./choose-control-style.md) and [design-reliable-collaborations](./design-reliable-collaborations.md). Map: [router](./responsibility-driven-design.md).
