terraform {
    backend "s3" {
    bucket = "terraform-state-my-bucket-001122334444"
    key = "terraform-state-my-bucket-0011223344/tfstate/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamodb-table"
  }
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
variable "ami" {
  description = "AMI"
  type        = string
  default = "ami-007855ac798b5175e"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.nano"
}

resource "aws_instance" "my_vm_1" {
ami           = var.ami //Ubuntu AMI
instance_type = var.instance_type
 
tags = {
  Name = "VM 1",
}
}
