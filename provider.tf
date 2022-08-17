provider "aws" {
  region  = var.region
  profile = var.profile
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}