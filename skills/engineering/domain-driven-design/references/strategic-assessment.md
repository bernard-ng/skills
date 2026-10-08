# Strategic assessment

Answer these before redesigning anything. Imperfect answers are fine; they give the work a starting position and show what is most urgent.

| Question | If the answer is "no" or "unclear" |
| --- | --- |
| Can you draw a consistent map of the models and how they connect? | `map-bounded-contexts` |
| Is there a shared language, and is it rich enough to discuss real requirements? | `build-ubiquitous-language` |
| Is it clear which part of the model makes the software valuable? Can you state it in one page? | `distill-core-domain` |
| Does the technology help or fight expressing the model in code? | Note the friction; consider `place-objects-in-layers` |
| Do the people building it have the skills for the hard part? | Flag as a risk, not a design problem |
| Do they know, and care about, the business? | Pair with an expert; schedule model conversations |

## How to use the answers

- Write the answers down in a few lines, not a document. Revisit them as understanding grows.
- The first gap you find is usually the first thing to fix. Missing language and missing boundaries cause the most damage.
- If everything is "yes", move to the building-block skills for the area you are changing.

## Starting a first release

Prefer a first slice through the core of the business, even if simple, over a slice through generic supporting features. Early work on supporting features proves the plumbing and teaches nothing about the hard part.
