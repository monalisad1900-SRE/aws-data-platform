"""
orders-etl: Extract → Transform → Load pipeline.
"""

import sys
sys.path.insert(0, "../../../")

from shared.utils import get_logger, get_aws_session

logger = get_logger("orders-etl")


def extract():
    logger.info("Extracting orders data...")
    # TODO: read from source (S3, RDS, API, etc.)


def transform(raw_data):
    logger.info("Transforming orders data...")
    # TODO: apply business logic


def load(data):
    logger.info("Loading orders data...")
    # TODO: write to target (S3, Redshift, DynamoDB, etc.)


if __name__ == "__main__":
    raw = extract()
    transformed = transform(raw)
    load(transformed)
