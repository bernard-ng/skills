---
name: science-research-writing
description: Use for any request to plan, draft, restructure, review, or polish English scientific research writing, such as journal articles, theses, dissertations, manuscript sections, abstracts, titles, or edits for non-native English speakers. Start here, then route to the section and language skills automatically, even when the user only says "improve this paragraph" or "write up my results".
---

# Science research writing

A writing aid, not a source of facts. Use only supplied data, methods, references, and journal rules; mark gaps instead of inventing them. All examples in this library are illustrative.

## Activate automatically

Apply this skill, and the specialist skills it routes to, whenever the text is research prose: a manuscript, thesis chapter, abstract, title, caption, or a paragraph that reports a method, result, or claim. Do not wait for a section name. Infer it from the content: aims and background suggest Introduction, "we measured" suggests Methods, numbers and figures suggest Results, "this suggests" suggests Discussion.

## Principles

1. **Conventional beats creative.** Readers and editors expect each section to do familiar jobs in a familiar order. A conventional structure and conventional phrasing make a paper easier to read and make small language slips less costly.
2. **Plan by move, not topic.** Decide what each sentence does (establish importance, give a source, state a gap, report a result, admit a problem) before choosing words.
3. **General before specific.** Give the overview, then the details. This applies to papers, sections, paragraphs, and sentences.
4. **Do not let the data stay silent.** Results need interpretation, Methods need justification, and contributions need to be stated. See [evaluative language](../evaluative-language/SKILL.md).
5. **Report problems where they happen.** Limitations first mentioned in the last paragraph look like concealment. See [limitations and future work](../limitations-future-work/SKILL.md).
6. **Hunt invisible errors.** A grammatical sentence can still say the wrong thing (tense, article, modifier, citation placement). These matter most because nobody flags them.

## Inputs

Article or thesis type, field, target journal and its author guide, sample articles, audience, voice preference, word limit, aim, methods, exact results with units and uncertainty, limitations, references, and the text to revise. Use what is supplied first. Ask for, or mark as a compact placeholder, anything essential that is missing.

## Workflow

1. Identify the task and section. If journal conventions are unknown and no samples were supplied, run [target article analysis](../target-article-analysis/SKILL.md) or state which defaults you assumed.
2. Prefer this drafting order for a full paper: Methods, Results, Introduction, Discussion or Conclusion, Abstract, Title. The Introduction needs the finished study, and the Abstract and Title derive from the finished paper. Presentation order stays Title, Abstract, Introduction, Methods, Results, Discussion.
3. For each section answer three questions: how does it start, what information goes in what order, how does it end. The section skills below answer them.
4. Write a one-line move map per paragraph, then draft from it.
5. Apply the language checks below silently while drafting; run them explicitly when editing.
6. Finish with [style editing](../scientific-style-editing/SKILL.md), and for a full manuscript the [consistency audit](../paper-consistency-audit/SKILL.md).

## Flows

This skill is the router. Most work follows the **main flow**; the on-ramps join it.

**Main flow, idea to submission**

1. Call the Skill tool with `target-article-analysis` if the journal or field conventions are unknown.
2. Draft in this order, calling the Skill tool for each section skill as you reach it: `write-methodology`, `write-results`, `write-introduction`, `write-discussion-conclusion`, `write-abstract`, `write-title`.
3. Call the Skill tool with `scientific-style-editing`, then, for a full manuscript, `paper-consistency-audit`.

**On-ramps**

- Only a language edit is requested: skip to step 3 and call the Skill tool for the matching language skills in the signal table.
- Only a section is requested: call the Skill tool for that section skill, then the language checks.
- Sources need work: call the Skill tool with `literature-review-positioning`, `formulate-research-gap`, or `citation-attribution`.
- Results need meaning: call the Skill tool with `evaluative-language`, `figure-table-commentary`, or `contribution-mapping`.
- Problems or weak results: call the Skill tool with `limitations-future-work`.

Each call loads one skill. When a step needs several, make several calls. Do not rely on the links below alone: naming the Skill tool is what makes the specialist run.

## Section skills

| Task | Skill |
| --- | --- |
| Background, gap, aim | [Introduction](../write-introduction/SKILL.md) |
| Materials, procedure, design | [Methodology](../write-methodology/SKILL.md) |
| Findings, figures, tables | [Results](../write-results/SKILL.md) |
| Meaning, contribution, closing | [Discussion and Conclusion](../write-discussion-conclusion/SKILL.md) |
| Summary for indexing | [Abstract](../write-abstract/SKILL.md) |
| Paper title | [Title](../write-title/SKILL.md) |

## Cross-cutting skills

| Need | Skill |
| --- | --- |
| Learn a field's conventions | [Target article analysis](../target-article-analysis/SKILL.md) |
| Prior work and gap | [Literature positioning](../literature-review-positioning/SKILL.md), [Research gap](../formulate-research-gap/SKILL.md), [Citation attribution](../citation-attribution/SKILL.md) |
| Reproducibility and displays | [Methods reproducibility](../methods-reproducibility/SKILL.md), [Figure and table commentary](../figure-table-commentary/SKILL.md), [Spatial description](../spatial-description/SKILL.md) |
| What results and contributions mean | [Evaluative language](../evaluative-language/SKILL.md), [Contribution mapping](../contribution-mapping/SKILL.md) |
| Problems and next steps | [Limitations and future work](../limitations-future-work/SKILL.md) |

## Automatic language checks

Scan for these signals and apply the matching skill.

| Signal in the text | Skill |
| --- | --- |
| Verb tense changes, or a sentence reports prior work, a procedure, a result, or an aim | [Tense](../tense-selection/SKILL.md) |
| "was done", "we", missing agent, cited and own work mixed | [Voice](../active-passive-voice/SKILL.md) |
| however, therefore, since, while, so, or no link between sentences | [Signalling](../signalling-transitions/SKILL.md) |
| Long or one-sentence paragraphs, unclear "this" | [Paragraphing](../paragraph-coherence/SKILL.md) |
| a, an, the, or no article before technical nouns | [Articles](../articles-determiners/SKILL.md) |
| Adverbs, "with" phrases, time or place phrases | [Modifiers](../modifier-placement/SKILL.md) |
| Stacked nouns, titles, prepositions | [Noun phrases](../noun-phrases-prepositions/SKILL.md) |
| then, after, while, subsequently, simultaneous steps | [Sequence](../sequence-language/SKILL.md) |
| always, often, sometimes, rarely, never | [Frequency](../frequency-language/SKILL.md) |
| Numbers, percentages, more, less, few, significant | [Quantity](../quantity-comparisons/SKILL.md) |
| caused, led to, due to, because, effect, link | [Causality](../causal-language/SKILL.md) |
| may, might, could, can, must, should, cannot | [Modal verbs](../modality/SKILL.md) |
| shows, proves, suggests, clearly, strong claims | [Claim strength](../claim-strength/SKILL.md) |
| Vague verbs, repeated "show", informal words | [Vocabulary](../academic-vocabulary/SKILL.md) |
| Units, abbreviations, data, criteria, phenomena | [Conventions](../scientific-conventions/SKILL.md) |
| Sentence correct but unclear or off-meaning | [Grammar and meaning](../grammar-and-meaning/SKILL.md) |

## Theses and dissertations

The same section models apply. A thesis usually has a single author, so use the passive, "this thesis", "in this study", or a dummy subject instead of "I". The literature review is longer and may be its own chapter. The Introduction's "present work" move becomes a chapter outline, and each chapter can repeat the section models at smaller scale. Follow the supervisor's and institution's rules first.

## Output contract

- **Draft:** the requested prose plus a short list of factual gaps and assumptions.
- **Critique:** name the move or meaning problem, quote a short excerpt from the user's text, and give a concrete revision.
- **Edit:** a clean revision plus a change log for edits that affect meaning, and open author questions.
- **Teaching:** explain the choice and give an original example.

Never silently change data, citations, or degree of certainty. Never invent results, references, methods, approvals, or priority claims.
