"""
Shared utilities for aws-data-platform pipelines.
Import in any project: from shared.utils import ...
"""

import logging


def get_logger(name: str) -> logging.Logger:
    """Return a configured logger for the given pipeline name."""
    logging.basicConfig(
        format="%(asctime)s [%(levelname)s] %(name)s - %(message)s",
        level=logging.INFO,
    )
    return logging.getLogger(name)


def get_aws_session(region: str = "us-east-1"):
    """Return a boto3 session. 
    Reads credentials from environment / IAM role."""
    import boto3
    return boto3.Session(region_name=region)
