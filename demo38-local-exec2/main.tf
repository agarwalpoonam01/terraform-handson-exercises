variable "instance_type" {
  description = "Instance type"
  type        = string
  default = "t2.micro"
}

variable "ami" {
  description = "AMI"
  type        = string
  default = "ami-007855ac798b5175e"
}

variable "res_tags" {
  type = map(string)
  default = {
    type = "app"
  }
}

resource "aws_instance" "my_vm" {
 ami           = var.ami //Amazon Linux AMI
 instance_type = var.instance_type
 
 provisioner "local-exec" {
   command = "echo 'Creation is successful.' >> creation.txt"
 }
 
 provisioner "local-exec" {
   when = destroy
   command = "rm creation.txt"
 }
 
 tags = var.res_tags
}