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

locals {
  bucket_name = "mytest"
  env         = "dev"
}
resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "${local.bucket_name}-newbucket"
 
  tags = {
    Name        = local.bucket_name
    Environment = local.env
  }
}