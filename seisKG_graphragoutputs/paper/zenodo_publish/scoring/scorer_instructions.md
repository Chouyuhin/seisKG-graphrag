# Blind scoring instructions (150 answers)

You are scoring answers produced by question-answering systems whose only knowledge source was an earthquake catalog
(and, where the condition says "catalog + narrative text", one background paper that was ingested with it). Score
each answer on how well it agrees with the catalog, not on how fluent or detailed it is. Do not discuss scores with the
other scorer until both sheets are complete.

## Materials
- `audit_sheet_v2_scorers.csv` — one row per answer: catalog, condition, question, answer, and, for questions with a
  single numeric answer, the reference answer computed from the catalog. Enter your score in your column; use `notes`
  for anything you want to flag.
- `scorer_catalog_facts.md` — the facts of each catalog (counts, spans, extremes, busiest days, distributions). Check
  every number in an answer against these facts or the reference answer before scoring.

## Scale (0-3)
- **3** Correct. The central claim is correct and verifiable against the catalog facts (or the narrative text, where
  applicable). A short answer that is exactly right scores 3; do not penalise brevity.
- **2** Correct central claim grounded in the data, but with secondary errors, omissions, vagueness where precision was
  available, or unverifiable embellishments.
- **1** Central claim wrong or missing although genuine records are used; or a refusal / "cannot determine" on a
  question the catalog can answer; or a mechanism/background answer that is clearly hedged as general knowledge
  and not supported by the data.
- **0** Fabricated values, hallucinated records or events not in the catalog, false claims presented as fact, or
  fabricated citations.

## Refusal convention (apply exactly)
- Category **D** (physical mechanism, faults, tectonic setting, induced seismicity, hazard) asked of a **catalog-only**
  condition: the catalog contains no mechanism information, so an honest refusal scores **3**. A substantive mechanism
  answer in this condition cannot be grounded in the data: **1** if clearly hedged as background knowledge, **0** if
  presented as data-derived fact or with invented citations.
- Category **D** asked of a **catalog + narrative text** condition: if the paper answers the question, grade against
  the paper (a refusal is then **1**); if it does not, a refusal scores **3**.
- Categories **A, B, C, E** are answerable from the catalog by definition: a refusal always scores **1**.
- An answer that partly refuses but states some facts is graded on the facts it states.

## Rules of thumb
- Fluency is not correctness. A confident answer with a wrong count, wrong maximum magnitude or wrong date is not a 3.
- Wrong scope: figures taken from a paper about the same sequence (a far larger event total, a mainshock before the
  catalog start) are wrong for a question about the catalog: 1 if the rest is right, 0 if nothing is right. In the
  narrative condition, values explicitly attributed to the paper are legitimate.
- Values explicitly attributed to history or literature ("the 1733 M7.8 Dongchuan earthquake") are not fabrications.
- A cluster-level or single-day figure is not a whole-catalog claim; mark it wrong only if it is impossible given the
  facts (magnitude above the catalog maximum, date outside the span, coordinates outside the region).
- An answer that describes a few days of a months-long catalog as if it were the whole catalog is wrong in scope: 1.
- Call a record "fabricated" (0) only when it contradicts the facts: a date outside the span, coordinates outside the
  region, a magnitude above the maximum. A wrong count or ranking on a day that does have events is 1, not 0.
