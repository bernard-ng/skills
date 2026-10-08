---
name: apply-design-patterns
description: Use when a recurring design problem resembles a known pattern, a pattern name is mentioned (Strategy, State, Command, Facade, Mediator, Observer, Adapter, Composite, Template Method, double dispatch), the user asks "should I use X pattern" or "what pattern fits", or a design is about to take a pattern off the shelf. Apply automatically to weigh a pattern's forces and consequences against the actual problem, and to adapt it to local roles instead of copying its textbook form.
---

# Apply design patterns

A pattern names a recurring problem, the forces that pull on it, the context where its solution fits, the solution in outline, and the consequences. It is a way to distribute responsibilities and organize collaborations, never a substitute for thinking.

## Why they help

Vocabulary (two words describe how objects cooperate), expertise (years of experience in compact form), and understanding (new people see the logic of a design). They also shift review from mechanics to whether the pattern fits.

## Procedure

1. **State the problem and forces.** What recurring difficulty are you facing, and what pulls in different directions (flexibility versus simplicity, speed versus clarity)? A pattern is only a candidate after this is written down.
2. **Find candidates.** Look through your notes on roles, duties, and control for matches. See [pattern notes](references/pattern-notes.md) for problems and typical consequences.
3. **Read the whole description.** Name, problem, context, forces, solution, and consequences. Check that your context matches. If not, look elsewhere or adapt.
4. **Weigh the consequences.**
   - Does it change your objects' roles and duties in ways that improve the design?
   - Does it make the design more adaptable, and is that needed, or is it overkill?
   - What viable alternatives exist (including no pattern)?
   - What does it do to complexity and clarity? Is it still a good choice?
5. **Compare with a plain alternative.** Often a simple condition, a method, a parameter, or a small object solves the problem. A pattern usually adds objects, indirection, and conventions.
6. **Adapt it.** Map the pattern's roles to your objects and rename them in local terms. Change duties where your situation needs it. Keep what makes the pattern work (what varies, what stays fixed) and drop the rest.
7. **Record the decision.** Note which pattern, which roles each object plays, and why. Use the pattern name in notes and code comments where it helps readers, but do not force class names to carry it unless that clarifies.
8. **Re-test.** Walk a normal and an alternate scenario through the new structure (see `trace-object-collaborations`).

## Guardrails

Choosing a pattern means not designing a solution of your own and accepting its distribution of duties, which may not be the best one for your goals. Do not apply a pattern to look sophisticated. Do not mix several patterns in one small problem. A pattern name used loosely ("this is a Strategy") can hide the real duties; say what each object does.

## Check

You can say which problem the pattern solves, which forces you accepted, what you gave up, and why a simpler option was not enough. Every role in the pattern maps to a real object with a real duty. New cases have a clear way in.

**Illustrative decision:** Several report formats share "render a report", so a Strategy-like shared role is justified by three real formats. For one report that may someday need a second layout, a parameter on the renderer is enough.
