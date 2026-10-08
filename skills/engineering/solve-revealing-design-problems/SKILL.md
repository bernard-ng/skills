---
name: solve-revealing-design-problems
description: Use when a design problem keeps resisting solution, each attempt exposes a new twist, stakeholders disagree on what "solved" means, the same part keeps producing bugs, or the user says "we're stuck", "this keeps getting harder", "no clean solution", or "wicked problem". Apply automatically to separate core, revealing, and ordinary design work, vary the problem instead of repeating attempts, and decide how much to invest.
---

# Solve revealing design problems

Some problems are hard in a particular way: working on them teaches you something new about the software, they resist tidy solutions, and it is hard to know when they are solved. Others are difficult but ordinary. Treat them differently.

## Classify the work

- **Core:** without it there is no reason to build the rest, and it must be solved. Ask what would happen if you fudged it.
- **Revealing:** pursuing it leads to a deeper understanding of the software. Difficulty alone does not make it revealing. Signs: you discover something new each time, people disagree on what is good enough, you hear yourself saying "that could never happen", or the solution may be a compromise rather than an answer.
- **The rest:** necessary, sometimes tedious, less inventive. Give it attention without total devotion, and budget time so it does not absorb all your spare cycles.

## Procedure

1. **Frame it.** Say which kind of problem it is (see `frame-design-problem`: control, connection, information display, workpiece, transformation) and ask that frame's questions. Do not treat a use-case list as the problem.
2. **Check it is revealing.** If it is only core, solve it with focused engineering. If it is revealing, expect fits and starts and work with the rhythm below.
3. **Vary the problem rather than repeating attempts.** Gauge whether an approach is likely to bear fruit, and notice dead ends early. Ways to vary it:
   - **Generalize:** state a broader problem and see whether it has a known answer.
   - **Specialize:** solve a concrete, smaller case.
   - **Analogy:** find a similar solved problem in another area.
   - **Decompose:** split it into parts and solve each, or find the part that is hard.
   - **Recombine:** put together pieces of several flawed attempts.
4. **Redefine the problem.** Imagine everything works as you want and the problem does not exist. Describe that world, then work out what must be true to get there. A redefinition does not always simplify the design; it opens new options.
5. **Synthesize.** Keep the strengths of several almost-good solutions and drop their weaknesses. Prefer a simple solution, but accept a more complex one when no simple one works.
6. **Treat uncertain boundaries as design.** For shared information across systems, decide who owns each fact, where a master copy is justified, and where it is better to discover facts when needed. For connections that fail, decide whether you validate what comes through (treating the other side as untrusted) or model the connection as another party with its own state and delays.
7. **Accept limits.** Some problems need a human decision (an order that cannot be undone, a cancellation that arrives after the work is done). Design a queue, an owner, and information for that person instead of pretending software can undo everything.
8. **Work in rhythm.** Intense concentration, then time away. Revealing problems need soak time. Block off long stretches for significant design work, and before stopping, write down where the design stands.
9. **Stay with it over time.** Some designs never become easy (for example, features that interact in subtle ways). Harden them with rigorous cases and keep tracking where new bugs concentrate.

## Guardrails

Do not solve a revealing problem through brute force, relentless attention, or a bigger framework. Do not hide a compromise; record it and who disagreed. Do not demand a solution to be true or false; solutions to wicked problems are good or bad. Do not skip the rest.

## Check

You can say which kind of problem each part is, what you tried and how you varied it, what you learned, what the accepted compromise is, and who owns the remaining risk.

**Illustrative case:** Order edits arrive while fulfillment is already underway in another system. Instead of an ever-more-clever reconciliation algorithm, redefine the problem: which changes are safe to apply automatically, which need a person, and what information must the person have in the problem queue?
