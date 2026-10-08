---
name: name-design-objects
description: Use when naming or renaming a class, interface, module, service, or role, when names such as Manager, Handler, Helper, Util, Processor, Data, Info, or Record appear, when two things share a name, or when a name hides what the object really does. Apply automatically whenever a new design candidate is created and when a name implies too much, too little, or an implementation detail.
---

# Name design objects

A name creates expectations about role and responsibilities. Good names add design momentum; careless ones set later work off course. A name that fits what readers already know needs less explanation.

## Procedure

1. **Name the role, not the mechanism.** Choose what clients will care about. Hide details that may change or that clients should not know (an accuracy tolerance, a singleton, a storage engine). Add one only if clients must know it.
2. **Fit an existing naming scheme.** Special cases extend a generic name by qualifying it (a specific kind of the general concept). Service providers often take "worker" names (a doer of a job) or a "service" suffix. Keep the scheme consistent within the design.
3. **Match the name to the scope.** A name that implies a large set of duties either is the wrong name or marks a broad concept that needs more specific neighbors. A name that is too narrow caps what the object may become.
4. **Choose a name that lasts.** Do not name an object for its first duty if it will do more. Rename when its work changes.
5. **Choose a name that does not limit behavior.** A "record" suggests only holding facts; a name that leaves room for decisions lets the object take responsibility.
6. **One meaning per name.** Do not give two things that coexist in the same application the same name, even if the language lets packages disambiguate. If a good name is taken, add a distinguishing adjective, or choose a synonym with a close meaning; do not reuse a familiar name for something radically different.
7. **Be readable.** No cryptic abbreviations or compressed words, except domain terms everyone knows. A longer name is fine if it is the shortest accurate one.
8. **Define it.** Write a short definition: start from a standard meaning if one fits, state what is specific to this system, and say what the object is not. Relate it to something widely understood.
9. **Keep general and specific.** If you can name three distinct special cases, keep the general concept and the special cases. If they share nothing, discard the general concept. If the general name is only too vague, rename it.

## Smells

- **Manager, Handler, Processor, Helper, Util:** usually a dumping ground or a role hidden behind a vague word. Find the specific job.
- **Data, Info, Record:** a passive holder name that invites logic to be put elsewhere. Ask whether it should decide things about what it holds.
- **Names that include a pattern or technology** (Singleton, Factory, Impl, a framework name) when clients do not care.
- **Names that include the first example** (ReportEmailer when it will also send to chat).

## Check

Could a newcomer guess the role and the main duty from the name alone? Does the name still fit the object's complete set of duties? Is it unique in the design?

**Illustrative renames:** "ReportManager" becomes "ReportScheduler" (coordinates timing) and "ReportRenderer" (does the work). "OrderRecord" becomes "Order" when it should enforce its own rules.
