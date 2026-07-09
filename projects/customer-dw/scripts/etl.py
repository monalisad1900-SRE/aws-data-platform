"""
customer-dw: Extract → Transform → Load pipeline for customer data warehouse.
"""

import sys
sys.path.insert(0, "../../../")

from shared.utils import get_logger, get_aws_session

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
