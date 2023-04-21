resource "aws_security_group" "http_access" {
 name        = "http_access"
 description = "Allow HTTP inbound traffic"
 
 ingress {
   description = "HTTP Access"
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 
 ingress {
   description = "SSH Access"
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 
 tags = {
   Name = "http_access"
 }
}

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
 
 key_name        = "example-key-pair"
 security_groups = [aws_security_group.http_access.name]
 
 provisioner "remote-exec" {
   inline = [
     "touch hello.txt",
     "echo 'Have a great day!' >> hello.txt"
   ]
 }
 
 connection {
   type        = "ssh"
   host        = self.public_ip
   user        = "ubuntu"
   private_key = file("./example-key-pair.pem")
   timeout     = "4m"
 }
 
 tags = var.res_tags
 
}