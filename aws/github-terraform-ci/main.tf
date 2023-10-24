terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# IAM Roles

module "common" {
  source = "../common/tfaction"

  repo_name               = "do-tanaka/tfaction-getting-started"
  s3_tfaction_bucket_name = "tanaka-tfaction"
}
