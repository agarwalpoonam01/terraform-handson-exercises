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
  bucket_name = "mytest-0000000"
  env         = "dev"
}
resource "aws_s3_bucket" "my_test_bucket" {
  bucket = local.bucket_name
 
  tags = {
    Name        = local.bucket_name
    Environment = local.env
  }
}