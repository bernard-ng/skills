# Glossary template

Keep this next to the code, such as `docs/glossary.md` or a section in the module README. Short entries only.

## Term entry

```
Term: Hold
Area: Lending
Means: A reservation of one copy for one member until a pickup deadline.
Is not: A loan. A held copy has not left the shelf.
Code: `Hold`, `Hold.lapse()`, `HoldRepository`
Replaces: "reservation" (used for room bookings in a different area)
```

## Sentence log

Record sentences experts used that the model must support.

```
"A hold lapses when the pickup deadline passes without checkout."
  -> Hold.lapse(clock) when deadline < now and no matching Loan
"A member over their limit cannot place a hold."
  -> HoldPolicy.allows(member, copy)
```

## Open questions

```
- Does a lapsed hold go to the next member automatically? (ask lending staff)
```

## Rules of the list

- One meaning per term per area. If you need two, write two entries with different names.
- Include the code name so the mapping is searchable.
- Remove terms that no longer exist. A stale glossary is worse than none.
