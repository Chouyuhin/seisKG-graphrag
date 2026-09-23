#!/bin/sh
# Regenerate every graph-quality table (R1-M4). Read-only on scoring/ and on the GraphRAG workspaces.
set -e
cd "$(dirname "$0")"
python3 entity_metrics.py
python3 relation_metrics.py
python3 community_metrics.py
python3 rule_graph_queries.py
python3 deterministic_baseline.py
python3 index_cost.py
