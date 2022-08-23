#!/bin/sh

# Args
# 1 - collection to add to
# 2 - path to metrics file

metrics_path="/github/workspace/$2"
python3 /upload_metrics.py "$1" "$metrics_path"
