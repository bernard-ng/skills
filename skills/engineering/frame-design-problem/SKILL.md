---
name: frame-design-problem
description: Use when starting a new feature, system, or module whose design is not yet clear, when requirements are vague, conflicting, or only user-facing, when asked "design a system for", "where do I start", or "what is hard about this", or before proposing any classes. Apply automatically at the start of non-trivial design work to write a short design story, find the themes and constraints that matter, and classify what is core before choosing objects.
---

# Frame the design problem

Most designs are too big to solve at once. Decide what the problem is and which parts deserve attention before inventing objects. Use only the requirements, code, and constraints supplied; mark assumptions.

## Procedure

1. **Write a design story.** In your own words and in two short paragraphs or less, say what is notable about the system, what it must do, how it supports its users, what will make it succeed, what is clear, and what is hard or ill defined. Do not polish. A story you write yourself shows what you think matters, and different views (use cases, architecture, sponsors, users) get pulled into one.
2. **Pull out themes.** Name three to five central concerns the story implies, such as "configure behavior per customer", "share a scarce connection pool", "restrict what each user may see". They organize the later search for objects.
3. **Find the boundary.** Separate the system from the actors, devices, and external programs around it. Actors take initiative and stay outside. Model who a user is only if identity changes behavior; otherwise model only their actions.
4. **Collect usage descriptions that add value.** Use cases, scenarios (numbered paths), and two-column conversations (user action beside system responsibility) all work. Add the exceptions, policies, design notes, and glossary terms that shape behavior. Write them from the user's point of view, in consistent language, and at a consistent level of detail. Skip any that add nothing for this task.
5. **Surface constraints.** Performance, concurrency, security, reliability, configuration, scale, and the "ilities" (maintainability, flexibility, extensibility) constrain design even when users never mention them. Ask which ones are real here.
6. **Name the problem frame.** Ask what kind of problem each part is, then ask that frame's questions:
   - **Control** (software drives external state): do commands have the intended effect, and how will you know?
   - **Connection** (information travels over an unreliable path): how reliable must it be, and what is the alternate path?
   - **Information display** (answers to queries): how precise, current, and historical must answers be?
   - **Workpiece** (users create and edit things): what is the thing, and how usable is the tool?
   - **Transformation** (inputs become outputs by rules): what loss is acceptable, and must it be reversible?
7. **Classify the work.** Core problems must be solved well or nothing else matters; ask what would happen if you fudged this part. Revealing problems teach something new each time you work on them (see `solve-revealing-design-problems`). The rest is necessary but needs less inspiration. Give attention in that order, but do not ignore the rest.
8. **List open questions.** Rank them by how much each answer could change the design, and carry on with explicit assumptions while you wait for answers.

## Output

A design brief of about one page: story, themes, boundary, frames, constraints, core list, assumptions, and ranked questions. Then hand off by calling the Skill tool with `discover-object-roles`.

## Guardrails

Do not invent requirements or numbers. Do not design objects here. Do not let a use case list pass as the design: use cases rarely mention control, coordination, errors, timing, or synchronization, so you must raise those yourself. Do not treat flexibility as a requirement; it is one possible response to a need for change.

## Check

Could someone else read the brief and say what matters, what is risky, and what you still do not know? Is the core named? Would a stakeholder recognize their concern in it?

**Illustrative story:** "This service exports customer reports to several formats. It must run for thousands of accounts overnight, share a limited renderer pool, and let each customer choose delivery channels. Choosing the right abstraction for formats and channels is hard; scheduling is clear."
