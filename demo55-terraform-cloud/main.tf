terraform {
    cloud {
        organization = "poonamagarwal081"

    workspaces {
      name = "example-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.1"
    }
  }

  required_version = ">= 1.2.0"

}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

resource "aws_security_group" "instance" {
  name = "terraform-example1-instance"
  
  ingress {
    from_port	  = 8080
    to_port	    = 8080
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }
}


resource "aws_instance" "app_server" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
vpc_security_group_ids  = ["${aws_security_group.instance.id}"]
  tags = {
    Name = "ExampleAppServerInstance"
  }
}