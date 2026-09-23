# Pre-screen summary (deterministic checks on the original answers)

| system | condition | full refusals | partial | out-of-catalog values (any) | mag | date | lat/lon | conflation |
|---|---|---|---|---|---|---|---|---|
| graphrag_pre | qiaojia_only | 4 | 2 | 6 | 6 | 0 | 0 | 0 |
| graphrag_pre | qiaojia_narrative | 2 | 9 | 9 | 9 | 1 | 0 | 0 |
| graphrag_pre | ridgecrest_only | 6 | 9 | 3 | 1 | 0 | 1 | 1 |
| graphrag_pre | ridgecrest_narrative | 5 | 8 | 5 | 0 | 0 | 0 | 5 |
| graphrag_pre | maduo_only | 15 | 8 | 30 | 29 | 4 | 1 | 4 |
| graphrag_pre | maduo_narrative | 7 | 7 | 76 | 28 | 52 | 0 | 72 |
| graphrag_post | qiaojia_only | 34 | 9 | 4 | 0 | 2 | 1 | 1 |
| graphrag_post | qiaojia_narrative | 31 | 12 | 8 | 1 | 2 | 4 | 1 |
| graphrag_post | ridgecrest_only | 16 | 13 | 3 | 1 | 0 | 1 | 2 |
| graphrag_post | ridgecrest_narrative | 15 | 17 | 0 | 0 | 0 | 0 | 0 |
| graphrag_post | maduo_only | 74 | 3 | 13 | 8 | 10 | 1 | 10 |
| graphrag_post | maduo_narrative | 75 | 5 | 7 | 3 | 5 | 1 | 5 |
| vector_rag | qiaojia_only | 76 | 5 | 0 | 0 | 0 | 0 | 0 |
| vector_rag | ridgecrest_only | 56 | 13 | 2 | 0 | 0 | 1 | 1 |
| vector_rag | maduo_only | 97 | 0 | 0 | 0 | 0 | 0 | 0 |
| graphrag_post2 | qiaojia_only | 25 | 19 | 0 | 0 | 0 | 0 | 0 |
| graphrag_post2 | qiaojia_narrative | 8 | 15 | 15 | 15 | 0 | 0 | 0 |
| graphrag_post2 | ridgecrest_only | 19 | 8 | 18 | 0 | 0 | 0 | 18 |
| graphrag_post2 | ridgecrest_narrative | 11 | 13 | 52 | 4 | 0 | 0 | 52 |
| graphrag_post2 | maduo_only | 68 | 19 | 32 | 32 | 0 | 0 | 1 |
| graphrag_post2 | maduo_narrative | 17 | 16 | 83 | 80 | 5 | 0 | 55 |
| graphrag_pre | luding_only | 10 | 1 | 89 | 87 | 0 | 7 | 88 |
| graphrag_post2 | luding_only | 45 | 17 | 48 | 48 | 0 | 0 | 14 |
| vector_rag | luding_only | 3 | 69 | 95 | 95 | 0 | 0 | 10 |

## Full refusals by system x category

| system | A | B | C | D | E |
|---|---|---|---|---|---|
| graphrag_pre | 2 | 20 | 7 | 18 | 2 |
| graphrag_post | 44 | 46 | 10 | 103 | 42 |
| graphrag_post2 | 21 | 42 | 0 | 93 | 37 |
| vector_rag | 35 | 50 | 33 | 61 | 53 |
