# graph_quality — direct evaluation of the GraphRAG-extracted graphs (reviewer 1, comment 4)

All scripts read the raw catalogs (`*/input/import_earthquakes.txt`), the GraphRAG index files
(`entities.parquet`, `relationships.parquet`, `communities.parquet` of the 15 indexes listed in
`scoring/index_stats.py`) and the rule-based reference graph (`reference/earthquake_graph.gexf`,
see `reference/README.md`). Nothing under `scoring/` or in a GraphRAG workspace is modified.
`./run_all.sh` regenerates every CSV.

## Matching an EVENT entity to a catalog record (`common_gq.py`)
1. Parse timestamp (title, else description), latitude, longitude, depth and magnitude from the entity text.
2. Candidate records: |dt| <= 1 s (stage-1 titles carry whole seconds only).
3. If coordinates were parsed, require |dlat|, |dlon| <= 0.01 deg and take the nearest candidate; magnitude
   breaks remaining ties. An entity whose timestamp matches a record but whose coordinates are more than
   0.01 deg away is reported as `unmatched_coord_mismatch` (a garbled record), not as a match.
4. Attribute checks on matched entities: magnitude exact if |dM| <= 0.05 (the entity text rounds to one
   decimal), depth exact if <= 0.1 km, coordinates exact if <= 0.001 deg; |dM| > 0.5 is counted as a
   magnitude field confusion (the failure mode of SM Text S4.1).

## Files
- `entity_metrics.py` -> `entity_metrics.csv`: per index, event coverage (distinct records matched / records),
  missing-record rate, duplicate rate (matched entities beyond the first per record / EVENT entities), entity
  precision (matched / EVENT entities), unmatched breakdown (no timestamp, outside span, no record within 1 s,
  coordinate mismatch), attribute accuracy, field-confusion count, type shares, format-collapse count.
  `entity_unmatched_examples.csv` lists examples.
- `relation_metrics.py` -> `relation_metrics.csv`: EVENT-EVENT relationships resolved to record pairs; the
  stated time gap / distance / same-day claim in the relationship text is checked against the catalog
  (`stated_relation_precision`); physical proximity of the linked pairs; for Qiaojia, overlap with and recall
  of the reference graph's NEARBY (< 3 km, 10 nearest) and NEXT_EVENT edge sets. EVENT-CLUSTER memberships
  (stage-2 indexes): cluster size, time span, RMS radius, and purity against the reference graph's Louvain
  communities.
- `community_metrics.py` -> `community_metrics.csv`: GraphRAG Leiden communities mapped to records; share of
  matched events that belong to any community (top level = coarsest partition, leaf = finest); median time span
  and RMS radius per community; for Qiaojia, adjusted Rand index and NMI against the reference Louvain
  partition; the reference partition's own compactness is the last row.
- `rule_graph_queries.py` -> `rule_graph_check.csv`, `rule_graph_check_summary.json`: enumerates the events by
  traversal (Sequence <- PART_OF - Event - OCCURRED_AT -> Time), recomputes the benchmark facts with
  `scoring/ground_truth.facts_for` and checks that all 44 deterministic per-question references are reproduced.
- `deterministic_baseline.py` -> `deterministic_vs_graphrag.csv`: mean score, strict-convention score, refusal
  rate and share of 3/0 scores of every scored system on the 44 deterministic-answerable questions, the 56
  interpretive ones, the 36 interpretive non-mechanism ones and all 100; plus the rows of a deterministic
  comparator (pandas/SQL over the table; rule-graph traversal for Qiaojia) that scores 3 on the 44 and refuses
  the rest (scored with the paper's refusal conventions). Stage-2 rows appear automatically once
  `scoring/per_answer_scores.csv` contains system `graphrag_post2`.

## Limits
- Relation and community references exist only for Qiaojia (the rule-based graph); the other catalogs get the
  catalog-derived checks.
- The reference graph is built from the same catalog, so these metrics measure extraction fidelity, not
  answer correctness.
- Run-to-run variability of extraction is not measured here (see the repeated-run analysis for reviewer
  comment 5).
- `entity_composition.csv`: what the entities of each index are (record-level EVENT, aggregate/garbled EVENT, GEO
  single coordinates / coordinate pairs / dates / column names, CLUSTER, SEQUENCE, HISTORICAL_EVENT, untyped);
  `entity_metrics.csv` also gives records represented exactly once, more than once and not at all (reviewer 1, minor 2).
- `index_cost.py` -> `index_cost.csv`, `index_cost_by_run.csv`, `query_latency.csv` (reviewer 1, comment 5): token
  usage of every index from GraphRAG's LLM response cache (OpenAI usage records with timestamps, attributed to
  indexing runs by the run windows of `logs/indexing-engine.log`; a workflow whose run made fewer calls than a
  quarter of the index's text units / communities is treated as cache-served and charged to the most recent run
  that did call the model, with a note), embedding tokens counted with tiktoken, cost at the list prices in
  `PRICES`, and per-question latency of the September 2026 stage-2 re-query (`scoring/stage2_cache`). Latency
  includes automatic retries after rate-limit errors, so it is an upper bound on model time.
