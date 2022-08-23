#!/bin/sh

# Args
# 1 - connection string
# 2 - collection to add to
# 3 - path to metrics file

if ["$1" = "NOT SET"]; then
    echo "Database connection string not specified"
    echo "1) Add your connection string as a secret"
    echo "2) Set the connection-string property to the appropriate env variable"
    echo "   E.g., connection-string: secret.CONNECTION_STRING"
    exit 1
fi;

metrics_path="/github/workspace/$3"
python3 /upload_metrics.py "$1" "$2" "$metrics_path"
