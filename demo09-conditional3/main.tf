terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}


variable "deploy_environment" {
    type        = bool
    description = "Optionally Create Keys"
}

variable "deploy_storage" {
    type        = bool
    description = "Optionally Create Keys"
}

resource "aws_s3_bucket" "bucket" {
    count   = var.deploy_environment && var.deploy_storage ? 1 : 0
    bucket  = "tinfoilbucket-mybucket-00001111"
}