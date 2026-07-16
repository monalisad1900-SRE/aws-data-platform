"""
inventory-pipeline: Extract → Transform → Load pipeline for inventory data.
"""

import sys

sys.path.insert(0, "../../../")

from shared.utils import get_logger  # noqa: E402

logger = get_logger("inventory-pipeline")


def extract():
    logger.info("Extracting inventory data...")


def transform(raw_data):
    logger.info("Transforming inventory data...")


def load(data):
    logger.info("Loading inventory data...")


if __name__ == "__main__":
    raw = extract()
    transformed = transform(raw)
    load(transformed)
