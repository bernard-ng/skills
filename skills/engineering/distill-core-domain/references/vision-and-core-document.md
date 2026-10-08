# Vision statement and core document

## Domain vision statement (one page)

Write for the whole team, including non-developers.

```
What the model is for:
  <two or three sentences on the value the domain model brings>

Whose interests it balances:
  <the groups served and how conflicts are resolved>

What makes it distinct:
  <the concepts and rules that set this model apart>

What it deliberately leaves out:
  <supporting or generic concerns handled elsewhere>
```

### In scope for the statement

The business value of the model, the main concepts, the balance of interests.

### Out of scope for the statement

Screens, platform, hosting, performance targets, logos. These matter, but they do not distinguish the model.

## Core document (three to seven sparse pages)

```
1. Core concepts (a list, one line each)
2. How they relate (a small diagram or paragraph per relationship)
3. Two or three key interactions walked through at an abstract level
4. Where to look in the code for each concept
```

Rules:

- Readable by non-developers.
- Minimal detail; point to code for the rest.
- Stable level of abstraction, so it ages slowly.
- Updating it is a team event: when a change forces an edit, consult the team and announce it.

## Flagging the core in code

Any visible marker works if a developer sees it without effort: a module name, a directory, a documented annotation, or a tag in a diagram. Prefer structural separation (a module) over comments when feasible.

## Sourcing generic subdomains

| Route | Good when | Watch for |
| --- | --- | --- |
| Off the shelf | A mature product fits closely | Evaluation cost, hidden coupling, version drift |
| Published model or standard | A rigorous model exists | Taking more than you need |
| Outsourced | Interface is clear, acceptance tests exist | Handover cost, uneven quality |
| In-house | Needs are small and specific | Underestimating maintenance |

## Segregating a core: steps

1. Identify a core subdomain.
2. Move its classes into a module named for the concept.
3. Remove data and behavior that do not express the concept; place them elsewhere.
4. Simplify and clarify the relationships to other modules.
5. Repeat for the next core subdomain.
