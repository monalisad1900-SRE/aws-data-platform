terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # bucket = "your-tfstate-bucket"
    # key    = "inventory-pipeline/terraform.tfstate"
    # region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

# TODO: define AWS resources for inventory-pipeline
# e.g. Kinesis streams, Lambda, DynamoDB, S3, IAM roles
