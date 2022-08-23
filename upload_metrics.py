import json
import os.path
import sys

import pymongo as pymongo


def main(args):
    """
    Connect to the metrics database and upload metrics to specified collection
    """
    client = pymongo.MongoClient(args[1])
    db = client["metrics"]
    collection = db[args[2]]

    doc = load_doc(args[3])
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
