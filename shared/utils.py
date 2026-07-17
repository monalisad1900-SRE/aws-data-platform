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
