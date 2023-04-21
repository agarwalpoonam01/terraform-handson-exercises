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


variable "res_tags" {
  type = map(string)
  default = {
    dept = "finance",
    type = "app"
  }
}
 
locals {
  all_tags = {
    env       = "dev",
    terraform = true
  }
  applied_tags = merge(var.res_tags, local.all_tags)
}
 
 
resource "aws_s3_bucket" "tagsbucket" {
  bucket = "tags-bucket" 
  tags = local.applied_tags
}
 
 
output "out_tags" {
  value = local.applied_tags
}
