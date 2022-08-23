import json
import os
import sys

import pymongo as pymongo


def main(args):
    """
    Connect to the metrics database and upload metrics to specified collection
    """
    connection_string = os.getenv("CONNECTION_STRING", default=None)
    if connection_string is None:
        sys.exit(
            "Connection string is not set."
            + "Please set the CONNECTION_STRING env variable in your system."
        )
    
    client = pymongo.MongoClient(connection_string)
    db = client["metrics"]
    collection = db[args[1]]

    doc = load_doc(args[2])
    collection.insert_one(doc)

    print(collection.find_one())


def load_doc(rel_path):
    if os.path.exists(rel_path):
        with open(rel_path, "r") as json_file:
            metrics_file = json.load(json_file)
            return metrics_file
    else:
        print("Specified path does not exist")
        sys.exit("Specified path does not exist")


if __name__ == "__main__":
    main(sys.argv)
