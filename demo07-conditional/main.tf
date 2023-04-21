terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


variable "create_or_not" {
    type        = bool
    description = "Optionally Create Bucket"
}

resource "aws_s3_bucket" "bucket" {
    count   = var.create_or_not ? 1 : 0
    bucket  = "mybucket-01my-tf-example-bucket-0000"
    
}

/*resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket[0].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.bucket[0].id
  acl    = "private"
}*/