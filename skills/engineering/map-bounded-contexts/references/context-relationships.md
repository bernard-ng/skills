# Context relationships

## Context entry

```
Context: Fulfilment
Owner: Warehouse team
Key terms: Item (a stocked unit), Pick, Shipment, Slot
Not in this context: marketing copy, price, tax
Model status: consistent; tests run on every merge
Known leaks: Item sometimes arrives with a price field from the catalog feed
```

## Link entry

```
Link: Catalog -> Fulfilment
Relationship: published language (ProductListed v2) with a translator in Fulfilment
Direction: Catalog is upstream
Contract: schema in `contracts/product-listed.json`; changes announced two sprints ahead
Failure mode: unknown fields ignored; missing required fields rejected and logged
Test: contract tests run by both teams
```

## Map format

A plain list is enough; add a diagram only if it helps.

```
Catalog     -> Fulfilment   published language
Catalog     -> Pricing      customer/supplier
Fulfilment  -> Billing      conformist
Billing     -> LegacyERP    anticorruption layer (owned by Billing)
Support     -  Fulfilment   separate ways (manual lookup)
```

## Questions for each link

- Who changes first, and who must follow?
- Can the teams actually coordinate on a schedule?
- What happens to the downstream if the upstream is unavailable or changes shape?
- Which terms cross the boundary, and are they translated?
- How do we test that the contract still holds?

## Shared kernel rules

Keep it small. Both teams own it. Any change needs the agreement of the other team and runs both test suites. If this becomes frequent pain, split or choose a different relationship.

## Anticorruption layer parts

- **Facade**: the few calls you actually need from the foreign system.
- **Adapter**: converts those calls to the foreign protocol and back.
- **Translator**: maps foreign concepts to your own model, in one place.
Keep the layer free of domain decisions; it only translates.
