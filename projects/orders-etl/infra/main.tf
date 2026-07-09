terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # bucket = "your-tfstate-bucket"
    # key    = "orders-etl/terraform.tfstate"
    # region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

# TODO: define AWS resources for orders-etl
# e.g. Glue jobs, Step Functions, Lambda, S3 buckets, IAM roles
