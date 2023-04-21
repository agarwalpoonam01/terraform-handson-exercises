


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
  shared_config_files      = [".aws/config"]
  shared_credentials_files = [".aws/credentials"]
  profile                  = "default"
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
  default     = "t2.micro"
}

resource "aws_instance" "my_vm_1" {
ami           = var.ami //Ubuntu AMI
instance_type = var.instance_type
 
tags = {
  Name = "VM1-aws-conf-demo",
}
}