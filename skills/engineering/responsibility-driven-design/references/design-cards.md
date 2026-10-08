# Design cards

Low-tech tools for early design. They are cheap to change, so they invite exploration. Use whatever medium you like (cards, sticky notes, a whiteboard, a text file); they are working notes, not permanent artifacts. If a card is typed up neatly it still has not made the design good.

## CRC card (candidate, responsibilities, collaborators)

**Front, purpose side**
- Name of the candidate (one per card).
- Purpose: one or two sentences in plain words. Say what kind of thing it is, what it does or knows, and one distinguishing fact (who it works with, what is interesting about it).
- Stereotypes, and any pattern role it plays.
- Questions, concerns, and "star" marks for important abstractions.

**Back, duties side**
- Responsibilities on the left, stated at the level above individual attributes and methods, with a strong verb where one fits.
- Collaborators on the right: the roles it calls on. List each once. Skip obvious ones (itself, standard library helpers).
- A running list of unassigned responsibilities kept separately until they find an owner.

**Rules of thumb**
- Brief statements. If a statement needs detail, put the detail in the purpose or a note, not in the responsibility line.
- If a card grows a long list, either the statements are too detailed or the object is doing too much.
- An object playing two roles gets two cards.

## Hot-spot card

Use to characterize a variation before designing for it. Name, a general description of what varies, and at least two concrete situations. Do not solve the variation on the card. See `design-variation-points`.

## Trace notes

During a walkthrough, rewrite cards when duties move. Note unanswered questions as you go instead of stopping to settle them.
