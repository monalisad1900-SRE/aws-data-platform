terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment once you have a tfstate bucket created in AWS
  # backend "s3" {
  #   bucket = "aws-data-platform-tfstate"
  #   key    = "orders-etl/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = var.aws_region
}

# ---------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------

variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment"
  default     = "dev"
}

# ---------------------------------------------------------------------------
# S3 Bucket — Raw orders data landing zone
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "orders_raw" {
  bucket = "orders-etl-raw-user-${var.environment}"

  tags = {
    Project     = "orders-etl"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "orders_raw_versioning" {
  bucket = aws_s3_bucket.orders_raw.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "orders_raw_encryption" {
  bucket = aws_s3_bucket.orders_raw.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "orders_raw_block_public" {
  bucket = aws_s3_bucket.orders_raw.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ---------------------------------------------------------------------------
# S3 Bucket — Processed orders data
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "orders_processed" {
  bucket = "orders-etl-processed-user-${var.environment}"

  tags = {
    Project     = "orders-etl"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "orders_processed_versioning" {
  bucket = aws_s3_bucket.orders_processed.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "orders_processed_encryption" {
  bucket = aws_s3_bucket.orders_processed.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "orders_processed_block_public" {
  bucket = aws_s3_bucket.orders_processed.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ---------------------------------------------------------------------------
# Outputs
# ---------------------------------------------------------------------------

output "orders_raw_bucket_name" {
  description = "Name of the raw orders S3 bucket"
  value       = aws_s3_bucket.orders_raw.bucket
}

output "orders_processed_bucket_name" {
  description = "Name of the processed orders S3 bucket"
  value       = aws_s3_bucket.orders_processed.bucket
}
