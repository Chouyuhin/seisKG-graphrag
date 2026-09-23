# residual_errors — hallucination classes and rates (reviewer 2)

`residual_errors.py` reads the judge output (`scoring/per_answer_scores.csv`) and the original answers, and writes
`residual_error_rates.csv` (system x condition, with Wilson 95% CIs), `residual_error_by_category.csv`,
`prescreen_guard.csv` (detection rate of the deterministic pre-screen) and `residual_error_examples.csv`.
Definitions are in the script docstring and in SM Table S13's note. Read-only on `scoring/`; rerun after any
re-scoring (e.g. judge pass 2) and rebuild the SM; the main-text numbers in Sections VI and VII then need a manual check.
