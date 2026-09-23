# Held-out catalog protocol (R1-M2) — frozen 2026-09-21, before any index or query was run

Purpose. Reviewer 1 (major comment 2) notes that the four prompt/configuration fixes were designed after inspecting
errors on the 100-question benchmark and were then re-evaluated on that same benchmark. We concede the point: every
question of the Qiaojia, Ridgecrest and Maduo benchmark was inspected during prompt design, so those 600 answers
(and their seismology-prompt repeat) constitute the **development set**. A fourth catalog is therefore held out and
queried once, with every component frozen as listed below. Nothing in this list was changed after the first Luding
answer was read.

## 1. Held-out catalog: 2022 Luding M6.8 aftershock sequence, first 90 days

| Item | Value |
|---|---|
| Source | `catalog/基于固定台网地震定位结果(2020-2023).txt` (Sichuan fixed-network locations, Jan 2020 – Aug 2023, 95,252 rows) |
| Reference epicentre | 29.59 N, 102.08 E (2022-09-05 Luding M6.8) |
| Spatial selection | haversine distance <= 50 km |
| Time window | 2022-09-04 00:00:00 <= t < 2022-12-03 00:00:00 (90 days, catalog clock) |
| Magnitude cut | none |
| Result | 8,061 events; 2022-09-04 03:29:03 – 2022-12-02 23:23:23; M0.5–4.5; depth 0.02–21.78 km; lat 29.155–30.016, lon 101.715–102.513 |
| Largest record | 2022-09-05 12:56:35 M4.5 (29.4035, 102.1938), 12.44 km |
| Busiest day | 2022-09-06 (451 events) |
| Builder | `scoring/make_luding_catalog.py` (17-column GraphRAG input, same layout as the other catalogs) |
| sha256 of `import_earthquakes.txt` | e346dd648b63482205ee574bd2e4973bb47818921090559e6c2df0810497aef8 |

Known property, stated in advance: the M6.8 mainshock (2022-09-05 12:52 local) is **absent** from the network catalog
(the first post-mainshock record is 12:55:21 M3.6) and no record exceeds M4.5. Any answer that reports "M6.8" as a
catalog value, or the mainshock as a catalog event, is therefore an out-of-catalog intrusion of pretrained knowledge,
directly analogous to the Maduo 22-May-2021 intrusion described in Section VI of the manuscript.

Why this catalog: tectonic aftershock sequence (like Ridgecrest and Maduo), Chinese (place-name-contamination test),
size between Qiaojia and Maduo, globally reported mainshock (misdating / intrusion test), no narrative text (catalog-only).

## 2. Conditions (catalog-only, three systems, 300 answers)

| Condition label | System | Workspace | Prompts | Settings |
|---|---|---|---|---|
| `luding_only_pre` | GraphRAG, default prompts | `seisKG_graphrag_luding/` | copy of `seisKG_graphrag_maduo/prompts` (identical to `seisKG_graphrag_ridgecrest/prompts`, the default-prompt runs of the paper) | copy of `seisKG_graphrag_maduo/settings.yaml`: entity_types [organization,person,geo,event], max_cluster_size 10, use_lcc default |
| `luding_only_v3` | GraphRAG, seismology-prompt seismology prompts (SM Texts S1–S4) | `seisKG_graphrag_luding_v2/` | copy of `seisKG_graphrag_ridgecrest_v2/prompts`, verified byte-identical to `zenodo_publish/prompts_v3.zip` | copy of `seisKG_graphrag_ridgecrest_v2/settings.yaml`: entity_types [geo,event,historical_event,cluster,sequence,fault,facility], max_cluster_size 10, use_lcc false |
| `luding_only_vecrag` | vector-RAG baseline | lancedb store of `seisKG_graphrag_luding_v2/` (`default-text_unit-text`) | system prompt of `run_baseline_vector_rag.py`, unchanged | top-10 cosine, gpt-4o-mini, temperature 0 |

Shared: gpt-4o-mini (extraction, reports, answers), text-embedding-3-small, chunk size 1200 / overlap 100,
GraphRAG 2.7.0 in conda env KG1.0 (the version that built the July indexes), community level 2, response type
"Multiple Paragraphs".

sha256 of frozen files (settings.yaml and every prompt template; `shasum -a 256`; rows labelled 'default' and 'seismology' = the two prompt sets):

```
default  578e122aabf320d16e7bee2f4e55116cc39fe11bd47bbb972df73a8c0555cc0a  settings.yaml
default  9335ba5053429004a1d9e1839aa3ab7a66148aec476a541537844041da34ddfe  prompts/extract_graph.txt
default  4f4e4e14a709fb3579197a79f0fab5b786462fbefb216105da89a692b7fb4018  prompts/summarize_descriptions.txt
default  5cbe6be5b965a5f4ca422d3ac1275df447496cb6e503e4b4aa0a3624d217553d  prompts/community_report_graph.txt
default  5b0c4a052245d1d2328422184f7bf5ebcd33f124dae8695953d7d68f4440da39  prompts/global_search_map_system_prompt.txt
default  6bc9e3f23e5509c10d3332f0d19c6cd85ee2d4d7b94e3f60f8ed5f094e717185  prompts/global_search_reduce_system_prompt.txt
default  52f26f5642a62127245f49ab2e8787a3f143cbb77f74123d834172591f9e9fd5  prompts/local_search_system_prompt.txt
seismology e6674dcda12f26a8cf3f635a19208ede72d8dcc4c84aa5b6e342e69171108db7  settings.yaml
seismology f44c9b89a6f2a43d896b1d5af3a7223e29e94dcee9ffdebae2a18e7ec5f69c84  prompts/extract_graph.txt
seismology 2cdfbb9a74d9c8d7b79ed3b95046bfa263d641539154c0cf4b6accee5b9e8585  prompts/summarize_descriptions.txt
seismology c27513fb1350a99f66f8f539424e88ba9f16b2a01fdfa0cb8f7c6c1eba4bd999  prompts/community_report_graph.txt
seismology aa294796214dbce66ae73f8ad6164a62c2c4babbf4450b502827607ddb323f44  prompts/global_search_map_system_prompt.txt
seismology 6b8f0d33bfaef1176715001e9e2290d160d04acff3adf52b64f58b28843cec17  prompts/global_search_reduce_system_prompt.txt
seismology 111f7a942a4ebfcefacab8d3e42cf96a5d13f1cef6f92d41f8933900db72470e  prompts/local_search_system_prompt.txt
```
(The remaining templates — basic/drift search, extract_claims, community_report_text, question_gen — are not used by
the Global/Local pipeline; their hashes are recoverable from the workspaces.)

## 3. Questions

The 100 development-set templates (`zenodo_publish/question_templates_en.json`, five categories x 20) instantiated with
`<CAT>` = "the 2022 Sichuan Luding M6.8 earthquake sequence". Retrieval mode per question (Global/Local) is the one
used for every development catalog (`benchmark_v2ap_results_raw_english.csv`, column `method`). All three held-out
conditions are queried in English, so the default-vs-seismology-prompt comparison on Luding is language-matched (on the
development set, default answers were Chinese and seismology-prompt answers English; see SM Text S6.1).

No question was written or altered for Luding; the catalog name is the only substitution.

## 4. Ground truth, pre-screen, judge, statistics

- Ground truth: `scoring/ground_truth.py` `facts_for()` applied to the Luding input file, unchanged; per-question references
  from the same `per_qid_references()`; no narrative block.
- Pre-screen (`scoring/prescreen.py`): the generic bounds checks (dates, coordinates, depth, magnitude outside the
  catalog range) plus three Luding-specific patterns declared here before running: (i) "M6.8" / "6.8级" asserted as a
  catalog value (catalog maximum is M4.5); (ii) dates before 2022-09-04 or after 2022-12-02 presented as catalog data;
  (iii) place names of the development catalogs (Qiaojia, Dongchuan, Ridgecrest, Maduo, Qinghai, Yunnan, Baihetan,
  California) = cross-catalog contamination.
- Judge: `scoring/judge.py`, gpt-4.1, two passes (seeds 1001/1002), same rubric, lenient convention with strict derived;
  the five deterministic convention overrides as for the development set.
- Statistics: category and condition means with bootstrap 95% CIs; paired per-question differences
  (seismology prompts − default; seismology prompts − vector-RAG) with bootstrap CIs, all questions and per category; error-mode counts
  from `error_rates.py` (judge flags: refusal, fabricated records, out-of-scope values; plus (i)–(iii) above).
  Held-out results are tabulated separately from the development set and never pooled with it.

## 5. Pre-stated success criterion

The development-set record (`scoring/summary.md`) shows that the fixes did **not** raise overall scores on
Qiaojia/Ridgecrest, lowered both narrative conditions, raised Maduo, raised Category D everywhere, lowered A/E, and
increased refusals. The claim to be tested on Luding is therefore the specific one:

1. the three targeted fabrication modes (impossible magnitudes via field confusion, historical-earthquake conflation,
   cross-catalog place-name contamination) are absent or rarer under seismology prompts than under default prompts;
2. Category D (physical mechanism) improves under seismology prompts;
3. at the cost of a higher refusal rate and no overall score gain (expected, reported as such).

Whatever the outcome, it is reported in full (SM Text S8, Tables S15–S16) and the manuscript claims are scoped to it.

## 6. Run log

| Step | When (2026-09-21, local) | Notes |
|---|---|---|
| catalog built | 15:4x | `make_luding_catalog.py`, 8,061 events, sha256 above |
| index, default prompts | 15:48 start; aborted 15:53 (API key revoked) and 22:11 (Tier-1 daily request cap); completed 22:47 on a Tier-2 key | GraphRAG 2.7.0 (KG1.0). Final build 12.8 min wall-clock, cache-assisted (responses of the two aborted attempts reused) -> not a cold-build time. 606 text units, 8,593 entities, 8,300 relationships, 305 communities; GEO 65%, EVENT 34%. 12 transient 429 retries, no other errors |
| index, seismology prompts | same three attempts; completed 23:07 | 31.6 min wall-clock, cache-assisted. 606 text units, 9,398 entities, 9,769 relationships, 1,066 communities; EVENT 88%, CLUSTER 10%. 194 transient 429 retries, no other errors |
| GraphRAG queries, default index (100) | 22:49-23:00 | `run_benchmark_heldout.py --workspace luding_only_pre --concurrency 4`; 0 failures; English answers |
| GraphRAG queries, seismology-prompt index (100) | 23:07-23:57 | `--workspace luding_only_v3 --concurrency 4`; throttled by the 2M TPM ceiling (each Global Search maps ~1,060 community reports) |
| vector-RAG queries (100) | 23:07-23:16 | `run_baseline_vector_rag_heldout.py`; 0 failures |
| pre-screen + judge pass 1/2 | 23:17 (default + baseline items); 23:58 (seismology-prompt items); repeatability on the 300 held-out items 98.3% exact, 99.7% within one point | gpt-4.1, seeds 1001/1002, same `judge.py` as the development set |
| aggregate / error rates / index stats / SM rebuild | 23:59-00:05 | `aggregate.py`, `error_rates.py`, `index_stats.py`, `build_si_document.py`; SM Text S8, Tables S10c and S15-S16; Zenodo copy in `zenodo_publish/heldout/` |

Observation logged at 23:20, before seismology-prompt answers were scored: the default-prompt system's Luding answers assert an M6.8
mainshock as catalog data in 88/100 answers (34 tie it to 5 September as an event) and quote further impossible magnitudes
(M6.1-M8.8) in 46/100; the judge scores these as fabricated, exactly as it scored the Maduo 22-May-2021 intrusion on the
development set. The question wording supplies the "M6.8" value (as "Mw 7.4" did for Maduo), which is the same design as the
development set and is stated in Text S8.

## 7. Amendments (logged with timestamp; none touches prompts, settings, questions, ground truth or judge)

- 2026-09-21 22:55, after the default-prompt answers were collected but before any was scored: the mechanical scan
  pattern (i) "M6.8 asserted as a catalog value" is narrowed to exclude the phrase "M6.8 earthquake sequence", because the
  question text itself names "the 2022 Sichuan Luding M6.8 earthquake sequence" and every answer echoes it. The count now
  covers uses of the M6.8 value beyond that echo (e.g. "the M6.8 mainshock occurred on", "magnitude of 6.8"). The judge's
  out_of_scope / fabricated flags are unaffected. The unnarrowed count is still recoverable from the answers.

- 2026-09-21 23:59, after scoring: one further mechanical count added to `error_rates.py`/Table S16b, "other magnitudes above
  catalog maximum" = answers whose pre-screen out-of-range magnitudes include a value other than 6.8 (separates the
  field-confusion fabrication mode from mainshock intrusion). Purely a re-tabulation of the existing pre-screen column.
- 2026-09-22 00:10, graph-level check (read-only, added to Text S8): the default-prompt Luding graph contains 588 magnitude-titled
  entities above the catalog maximum (incl. an entity "M6.8") and 8/305 community reports describing an M6.8 event, although no
  text unit contains the value; the seismology-prompt graph contains none, so the residual seismology-prompt M6.8 answers arise at query time.
