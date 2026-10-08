## What it does

Chooses names that reveal role and duty, fit a naming scheme, are unique, and still fit as the object grows.

It treats Manager, Helper, Util, Data, and Info as smells that hide a role.

## When to reach for it

- **Invocation.** Model-invoked: the agent reaches for it when the task fits, or you can name it.
- **Trigger boundary.** Reach for this whenever a class, interface, or module is named or renamed, or two things share a name.

## Common questions

**Is a long name acceptable?**
Yes, if it is the shortest accurate one. Cryptic abbreviations are not.

## It's working if

- A newcomer can guess the role and main duty from the name.

## Where it fits

Used by [discover-object-roles](./discover-object-roles.md) for every candidate. Map: [router](./responsibility-driven-design.md).
