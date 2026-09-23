# Data and code for "Automatic Knowledge Graph Construction and Query for Earthquake Catalogs"

Zhou, Y., H. Zhang, and S. M. Mousavi (IEEE Access, under revision). Zenodo doi:10.5281/zenodo.21459373. Everything the paper and its Supplementary Material refer to as the "Zenodo data set" is in this record.

## Catalog data

- `import_earthquakes_qiaojia.txt` — Qiaojia-Dongchuan relocation catalog (5,218 events; the authors' own data)

The 2019 Ridgecrest catalog (Shelly, 2020, SRL, doi:10.1785/0220190309) and the 2021 Maduo catalog (Guan, Lei & Zhao, 2024,
Tectonophysics) are third-party data available from their original publications and are not redistributed here; the
configuration and prompts below regenerate those indexes directly from the original files.

## Benchmark questions

- `question_templates_en.json` — the 100 question templates (`<CAT>` = catalog name); SM Table S8
- `benchmark_questions_v2_full.csv` — the questions as posed to the systems, per catalog (600 rows)

## Answers (original experimental record)

- `benchmark_v2_results_raw.csv` — 600 GraphRAG answers, default prompts (10 July 2026)
- `benchmark_v2ap_results_raw.csv` — 600 GraphRAG answers, intermediate prompt revision (SM Texts S1-S3; 10 July 2026; not reported in the main text)
- `benchmark_v3_results_raw.csv` — 600 GraphRAG answers, seismology prompts as reported in the paper (SM Texts S1-S4; indexes of 14-15 July 2026, queried September 2026)
- `baseline_vector_rag_results_raw.csv` — 300 vector-RAG baseline answers (catalog-only)

Columns: condition, qid, method, question, answer. All scores were assigned on these original answers.

## English versions (for reading)

Every question and answer is also provided in English: `benchmark_v2_results_raw_english.csv`,
`benchmark_v2ap_results_raw_english.csv`, `benchmark_v3_results_raw_english.csv`, `baseline_vector_rag_results_raw_english.csv`
(columns: condition, qid, method, question_en, answer_en).

## Scoring (SM Text S6)

Folder `scoring/`:

- `ground_truth.py` / `ground_truth.json` / `ground_truth.md` — catalog-derived facts and deterministic per-question references
- `prescreen.py` / `prescreen.csv` — refusal, out-of-range and conflation flags for every answer
- `context.py` — per-answer catalog look-ups (days, months, magnitudes mentioned) supplied to the judge
- `judge.py` — LLM judge (gpt-4.1, temperature 0, two seeded passes, JSON-schema output); complete prompt inside
- `aggregate.py` — convention enforcement, category means, bootstrap and paired-difference confidence intervals, judge agreement
- `per_answer_scores.csv` — one row per answer: final score (lenient and strict convention), both judge passes, flags, justification, question and answer
- `category_means.csv`, `bootstrap_ci.csv`, `paired_diff_ci.csv`, `judge_agreement.csv`, `error_rates.csv`, `summary.md`
- `audit_sheet_v2.csv` / `audit_key_v2.csv` — blind human-audit sheet and its key; `audit_sheet_2026-07.csv` — the original 30-item audit (July 2026)
- `index_stats.py` / `index_stats.csv` — indexing wall-clock time and graph size of every index (SM Table S11)
- `run_benchmark_stage2.py` — the September 2026 re-query of the seismology-prompt indexes (Texts S1-S4) (GraphRAG 2.7.0 query API)
- `make_figures.py` — regenerates the score figures from `category_means.csv`

## GraphRAG configuration and prompts

- `settings.yaml` — GraphRAG 2.7.0 configuration of the seismology-prompt runs (per-catalog copies differ only in paths)
- `settings_default.yaml` — configuration of the default-prompt runs; the two files differ only in `extract_graph.entity_types` and `cluster_graph.use_lcc` (SM Table S9)
- `prompts_v2.zip` — intermediate prompt revision templates (SM Texts S1-S3; not reported in the main text)
- `prompts_v3.zip` — final seismology prompt templates (SM Texts S1-S4; the system reported in the main text)
- `run_baseline_vector_rag.py` — the vanilla vector-RAG baseline

## Graph-quality evaluation (SM Text S7, Table S13)
- `graph_quality/`: scripts (`run_all.sh`) and tables (`entity_metrics.csv`, `relation_metrics.csv`,
  `community_metrics.csv`, `rule_graph_check.csv`, `deterministic_vs_graphrag.csv`) that match every extracted
  EVENT entity of the twelve development-set GraphRAG indexes back to its catalog record and compare relations and communities
  with the rule-based Qiaojia graph. See `graph_quality/README.md` for the matching rules and metric definitions.
- `graph_quality/reference/earthquake_graph.gexf`: the rule-based reference graph of the Qiaojia catalog
  (10,766 nodes, 113,620 edges; explicit schema), with its construction notebook `build_rule_graph.ipynb` and
  provenance in `graph_quality/reference/README.md`.
- `graph_quality/index_cost.csv`, `index_cost_by_run.csv`, `query_latency.csv`: token usage, API cost and query
  latency of every index (SM Table S11), extracted by `graph_quality/index_cost.py` from the GraphRAG LLM cache and
  the seismology-prompt query records.
- `residual_errors/`: `residual_errors.py` and its tables (`residual_error_rates.csv`, `residual_error_by_category.csv`, `residual_error_examples.csv`, `prescreen_guard.csv`) behind SM Table S14 (residual hallucination classes: mainshock misidentification,
  out-of-catalog mainshock and event total presented as data, fabricated records, deterministic pre-screen detection rate).

## Held-out catalog test of the prompt fixes (SM Text S8, Tables S10c and S15-S16)

Folder `heldout/` (added at revision, September 2026, in response to reviewer 1's request for a development/test split):
- `heldout_protocol.md` — protocol frozen before any run (catalog definition, sha256 hashes of every prompt and settings file, pre-stated success criterion, run log, logged amendments).
- `make_luding_catalog.py` and `import_earthquakes_luding.txt` — builder and resulting GraphRAG input for the 2022 Luding M6.8 aftershock sequence, first 90 days (8,061 events, M0.5-4.5, within 50 km of 29.59 N 102.08 E).
- `run_benchmark_heldout.py`, `benchmark_heldout_luding_raw.csv` — the 100 English template questions posed to the default-prompt index (`luding_only_pre`) and the seismology-prompt index (`luding_only_v3`; the `_v3`/`_v2` identifiers denote the prompts_v3 set), 200 answers.
- `run_baseline_vector_rag_heldout.py`, `baseline_vector_rag_heldout_raw.csv` — the vector-RAG baseline on the same catalog (`luding_only_vecrag`), 100 answers.
The 300 held-out answers are scored with the unchanged `scoring/` pipeline and appear in `per_answer_scores.csv` under catalog `luding`; they are never pooled with the development-set (Qiaojia, Ridgecrest, Maduo) results.
