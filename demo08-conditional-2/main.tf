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

variable "count_or_not" {
    type        = bool
    description = "Optionally Create Multiple Buckets"
}

variable "bucket_names" {
    type        = list #--Define variable as a list of strings
    default = ["mybucket-jaya-1", "mybucket-jaya-2"] #--Define the two items in the list
}

resource "aws_s3_bucket" "bucket" {
    count   = var.count_or_not ? length(var.bucket_names) : 0 #--Evaluate conditional. If var.provision is true, provision the amount of buckets defined in var.bucket_names
    bucket  = var.bucket_names[count.index] #--Create buckets as named in var.bucket_names, iterating over list
}