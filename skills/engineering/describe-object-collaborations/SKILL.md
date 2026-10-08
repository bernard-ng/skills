---
name: describe-object-collaborations
description: Use when writing a design document, architecture note, README section, pull request description, or ADR that explains how objects, services, or components cooperate, when asked to "draw a sequence diagram", "document this design", "explain how these classes interact", or "make a diagram of the flow", or when existing diagrams are cluttered or out of date. Apply automatically to choose what to show, at what level of detail, and in which form, then tell the story clearly.
---

# Describe object collaborations

Tell a design story that readers can digest. Decide what you want them to learn, at what depth, and in which form. No single picture or paragraph tells all, and precision is not the same as accuracy.

## Procedure

1. **Establish scope, depth, and tone.** What should the reader be able to do or decide afterward? Is this a rough idea for feedback or a record? Informal stories can be brief because you are present to answer questions; stories that stand alone need some written explanation next to the drawing.
2. **List what you will cover and what you will leave out.** List everything, including exclusions, before organizing. Examples: only the happy path, calls to the slow backend, a normal request and not UI details.
3. **Choose the view.**
   - **Bird's-eye:** subsystems, their dependencies, and optionally their interfaces.
   - **Participants only:** roles and the paths between them, showing who sees whom (arrows) only if you know.
   - **Sequence of interactions:** a numbered collaboration or a sequence diagram for one scenario.
   - **In-depth:** branches, loops, timing, or exceptions, when they matter.
   - **Focused:** treat the rest as a black box and zoom into one interaction. Abstract UI events to intentions ("save the document").
   - **Implementation:** what has actually been built; label it as such.
   - **Adaptation:** how to vary the design; see `design-variation-points`.
4. **Pick the right form for the content.** CRC notes for what an object knows and does. Collaboration diagrams for relationships among objects. Sequence diagrams for message order on one path. Tables for exceptions and their handling. Pseudo-code, text, a state diagram, or a decision table for algorithms, because a sequence diagram shows calls, not branching reasons or side effects. A running commentary beside a diagram explains what a diagram cannot.
5. **Tell it, draw it, describe it.**
   - Do not overwrite: draw at the level your audience needs. Show a typical case first and note how others differ.
   - Do not overstate: show only what you know and can defend. If you know only the paths, do not draw messages. If you know the messages but not the arguments, do not make arguments up.
   - Omit needless words and visual noise: return values that do not change the flow, internal algorithm detail, caching, object creation and destruction, and the internals of preexisting libraries. Skip commentary about the commentary.
   - Revise: if readers do not understand, redraw. If readers want different detail, draw an abridged and a full version. Break big diagrams with linked sub-diagrams. Keep about ten participants and twenty-five messages per diagram.
   - Do not be breezy: do not skip hard details because they are hard to draw. State them, even redundantly.
   - Be clear: choose the form that fits, annotate sparingly, and arrange collaborators so the reader does not hunt for the next message (a coordinator in the middle, objects by layer).
   - One voice: keep a single point of view and level. Do not drop two levels to explain a library. Keep notes to a small share of the text; too many parentheses signal hesitation.
6. **Organize.** Put first what needs emphasis, and orient readers before the story. Present the problem before the solution, things before their relations, and the normal case before exceptions. Fundamentals first is a guide, not a rule: forward references are fine if they build interest. Relegate background to an appendix.
7. **Show exceptions separately.** Keep the happy-path diagram clean; add a table or short commentary per step, and draw new diagrams only for key exception cases.
8. **Preserve the stories worth keeping.** Keep the ones that tell what the code cannot, and update them when responsibilities shift among collaborators or new objects become central. A changed message or argument rarely needs a redraw.

See [forms and examples](references/forms.md) for a quick chooser.

## Guardrails

Do not generate diagrams from code and call them a design. Do not label a proposal as a working solution. Do not let precision outrun knowledge. Do not hand-draw what a few sentences explain better.

## Check

A reader can state what the scenario is, who takes part, who decides, and where the design is uncertain. The title says whether the picture is proposed or implemented. Nothing in it is invented to fill a blank.
