#!/bin/bash

# Args
# 1 - collection to add to
# 2 - path to metrics file

if [ -z "${CONNECTION_STRING}" ]; then
  error "No [CONNECTION_STRING] set"
fi

metrics_path="/github/workspace/$2"
python3 /upload_metrics.py "${CONNECTION_STRING}" "$1" "$metrics_path"
