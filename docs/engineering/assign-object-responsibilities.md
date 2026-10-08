## What it does

Derives duties from behavior and places them with coherent roles, keeping behavior with the information it uses and testing each object for purpose, clarity, and fit.

It states duties above the level of getters and attributes.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this when a class does too much, a controller decides everything, or a duty has no owner.

## Common questions

**What if two objects both seem right?**
Pick one, walk a scenario, and switch if it feels wrong. There may be several workable answers.

**Is it fine to have data holders?**
Yes for simple facts, but beware a controller that interrogates them to decide.

## It's working if

- Each important action has one clear owner.
- Open duties and policy choices are visible.

## Where it fits

Chain step 3. Tested by [trace-object-collaborations](./trace-object-collaborations.md). Map: [router](./responsibility-driven-design.md).
