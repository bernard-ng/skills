# Hot-spot card and recipe

## Hot-spot card

```
Hot spot name:        (short noun phrase)
What varies:          (general description of the semantics of the variable behavior)
Situation 1:          (concrete example)
Situation 2:          (concrete example; add a third when you have it)
Who / when changes it: (developer or end user; design time, install, start-up, run time)
Notes:                (open questions, related hot spots)
```

Keep it light. It characterizes the variation so that design strategies can be compared. It does not pose the design solution.

## Questions per hot spot

- What is the focus (the duties directly affected) and the scope (how much else it touches)?
- Is it a tweak, a modest investment, or a major design effort? An extension of what exists, or something new?
- When does it vary: once, on a setting change, or while operating?
- Who varies it, and what do they need to know?
- What would a simple, inflexible solution cost if this variation recurs?

## Recipe template

```
Recipe name:       How to ...
Intent:            Why you would follow this recipe.
Design description: Classes and roles involved, their duties, the collaborations touched.
Related recipes:   Alternatives or sub-recipes.
Steps:             1. ... 2. ... 3. ...
Discussion:        Pitfalls, how to test the change, what not to attempt.
```

## Knobs worth providing

- A single method that applies a set of related changes in one atomic step.
- A tool that checks and reports inconsistent settings.
- Sample code to copy when no knob exists.
- A test entry point that checks an adaptation did not break existing behavior.
