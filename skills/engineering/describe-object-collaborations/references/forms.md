# Forms for describing collaborations

| Goal | Simple form | To go further |
| --- | --- | --- |
| Responsibilities and collaborators of each role | Notes or cards, copied into the document | Add a short purpose and stereotype per role |
| Which objects work with which | Collaboration diagram of roles and links | Add visibility arrows only where known |
| Paths between subsystems | Package or subsystem diagram with dependencies | Add subsystem interfaces |
| One interaction in order | Numbered collaboration diagram or sequence diagram | Add running commentary; treat subsystems as large objects |
| A complex algorithm | Text, pseudo-code, a worked example, or a state diagram | Annotate an interaction diagram with branch conditions |
| Detailed interactions | Sequence diagram | Add guards, loops, timing, notes |
| Exceptions | Table: condition, detected by, handled by, recovery, effect on user | Extra diagrams only for key cases |
| Design alternatives | Short description and rationale | Extra diagrams for the key alternatives |
| How to vary the design | A recipe with steps and a typical interaction | Mark where alternates plug in; link to examples |

## Emphasis

Position, highlighting, white space, space given, centering, lists, repetition, and restating in a second form all draw attention. Use them deliberately and sparingly.

## Fundamental first

Things beyond your control come before things you design. Things come before their relationships. The normal case comes before exceptions.

## Pacing

After four or five nearly identical drawings attention drops. Point out similarity, call out what differs, or say that the next several are alike and can be skimmed.
