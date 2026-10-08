# Responsibility notes

## Statement style

| Prefer | Over |
| --- | --- |
| credit, debit, remove, merge, calculate, register, activate | process, record, find, maintain, list, accept |
| "knows the customer's name and preferred forms of address" | "knows first name", "knows last name", "knows nickname" |
| "calculates all applicable taxes for a locale" | one line per tax type |

A general statement can cover many specific requests. If you worry about forgetting the detail, add a hint in brackets or put it in the purpose line.

## Getting unstuck

| Problem | Move |
| --- | --- |
| A big duty fits no one ("interact with the user", "manage resources") | Treat it as a problem statement. Break it into specific duties and check whether the specific ones already have owners; if they do, you are finished. |
| A duty is too vague to break down | Ask someone who knows the problem for specifics. It may already be covered by assigned duties. |
| Two or three plausible owners | Ask what each option implies for neighbors. Pick one arbitrarily, walk the scenario, and switch if it feels wrong. There may be several workable answers. |
| A specific duty has nowhere to go | You may need a new candidate, or it may be an implementation detail that does not belong at this level yet. |
| You doubt a duty can be fulfilled | Follow the doubt and work out how, but keep implementation choices open until collaborations are settled. |
| One object keeps growing | Check whether its duties are stated in too much detail or it is actually doing too much. Split it into cooperating objects, or restate the duties at a higher level. |

## Reminders

- A responsibility to "know" can be met by holding a fact, deriving it, or asking a collaborator.
- Objects in lower domains (foundation, structural, semantic) should not depend on those in higher domains (business, application). Ask whether one can be built without any knowledge of the other.
- Public duties first, private duties after.
- Keep a running list of unassigned duties and revisit it when a new candidate appears.
