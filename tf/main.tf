terraform {
  backend "s3" {
    bucket  = "chatto" # Your unique AWS S3 bucket
    key     = "dev/chattoapp.tfstate"
    region  = "us-east-1" # Your AWS region
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"

  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "Adam Dubey" # Your fullname
  }
}
