"""
customer-dw: Extract → Transform → Load pipeline for customer data warehouse.
"""

import sys
from shared.utils import get_logger

sys.path.insert(0, "../../../")

logger = get_logger("customer-dw")


def extract():
    logger.info("Extracting customer data...")


def transform(raw_data):
    logger.info("Transforming customer data...")


def load(data):
    logger.info("Loading into customer DW...")


if __name__ == "__main__":
    raw = extract()
    transformed = transform(raw)
    load(transformed)
