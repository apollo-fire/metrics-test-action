#!/bin/bash

# Args
# 1 - connection string
# 1 - collection to add to
# 2 - path to metrics file

metrics_path="/github/workspace/$3"
python3 /upload_metrics.py "$1" "$2" "$metrics_path"
