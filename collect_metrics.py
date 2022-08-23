import json
import os
import sys

import pymongo as pymongo


def main(args):
    """
    Collect some metrics and save to a json file
    """
    metrics_data = {
    "name": "some test repo",
    "data": "some other data that was collected"
    }
    save_doc(args[1], args[2], metrics_data)

def save_doc(metrics_path, collection, data):
    if os.path.exists(metrics_path):
        pass
    else:
        print("metrics directory does not exist, creating")
        os.mkdir(metrics_path)

    file_path = os.path.join(metrics_path, collection)
    with open(f"{file_path}.json", 'w') as json_file:
        json_string = json.dumps(data, default=lambda s: str(s))
        json_file.write(json_string)


if __name__ == '__main__':
    main(sys.argv)
