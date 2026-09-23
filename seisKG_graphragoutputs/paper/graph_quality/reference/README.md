# Rule-based reference graph of the Qiaojia-Dongchuan catalog

`earthquake_graph.gexf` is the hand-designed, rule-based knowledge graph referred to in the manuscript
(10,766 nodes, 113,620 edges). It was built from the same 5,218-event Qiaojia catalog that GraphRAG ingests
(`seisKG_graphragoutputs/input/import_earthquakes.txt`; Event node id = catalog `event_id`).

Provenance: repository `Seismic-Graph-Knowledge` (first author), file added 2025-12-23 (commit 99964fc1,
`gephi/earthquake_graph.gexf`), moved to `nnd_for_QJ/` 2026-02-03 (99a56786), archived 2026-06-02 (1c3af96a),
removed from that repository 2026-09-15 (9bdcb32b). The copy here is `git show 1c3af96a:archive/nnd_for_QJ/earthquake_graph.gexf`.
`build_rule_graph.ipynb` is the notebook that produced it (same commit, originally `gephi.ipynb`); cells 0-1 are
the construction and topology steps.

Schema (explicit, pre-defined):
- Node types: Event (5,218; attributes mag, depth, latitude, longitude, orig_time, pagerank, community_id),
  Time (5,189 distinct origin times), Depth (310 rounded values), Magnitude (48 rounded values), Sequence (1).
- Edge types and rules: OCCURRED_AT, HAS_MAGNITUDE, AT_DEPTH, PART_OF (one per event); NEXT_EVENT (time-ordered
  chain, 4,521 after de-duplication of identical timestamps); NEARBY (Haversine distance < 3 km, at most the 10
  nearest, lower id -> higher id; 43,275); MAG_MORE_THAN (within 5 km, magnitude difference >= 0.5, top 5 per
  event; 21,561); DEPTH_MORE_THAN (within 5 km, depth difference >= 2 km, top 5; 23,391).
- Topology: PageRank and Louvain communities (seed 42) computed on the Event-only subgraph; 17 communities.
