#!/bin/sh

# Args
# 1 - connection string
# 2 - collection to add to
# 3 - path to metrics file

if [ "$CONNECTION_STRING" = "" ]; then
    echo "Database connection string not specified"
    echo "1) Add your connection string as an env value"
    echo "2) Set the connection-string property to the appropriate env variable"
    echo "   E.g.,"
    echo "   env:"
    echo "     CONNECTION_STRING: ${{ secret.CONNECTION_STRING }}"
    exit 1
fi;

metrics_path="/github/workspace/$3"
python3 /upload_metrics.py "$CONNECTION_STRING" "$2" "$metrics_path"
