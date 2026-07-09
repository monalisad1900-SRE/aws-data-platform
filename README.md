# aws-data-platform

AWS-native data pipeline monorepo. Each project contains ETL scripts and Terraform infra code deployed independently on AWS.

## Structure

```
aws-data-platform/
├── projects/
│   ├── orders-etl/          # Orders ingestion & processing
│   │   ├── scripts/         # Python ETL code
│   │   └── infra/           # Terraform (AWS Glue, S3, IAM, etc.)
│   ├── customer-dw/         # Customer data warehouse
│   │   ├── scripts/
│   │   └── infra/           # Terraform (Redshift, Glue, etc.)
│   └── inventory-pipeline/  # Inventory data pipeline
│       ├── scripts/
│       └── infra/           # Terraform (Kinesis, Lambda, etc.)
├── .github/
│   └── workflows/           # CI: lint, test, terraform validate
└── shared/                  # Utilities shared across all projects
    └── utils.py
```

## Getting Started

```bash
# Install shared deps
pip install boto3

# Run a pipeline locally
cd projects/orders-etl/scripts
python etl.py

# Deploy infra
cd projects/orders-etl/infra
terraform init
terraform plan
terraform apply
```

## CI/CD

GitHub Actions runs on every push: Python lint + tests and `terraform validate` for each project.
