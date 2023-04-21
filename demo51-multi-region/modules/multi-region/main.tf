resource "aws_security_group" "my-security-group" {
 name        = "my_seciurity_access_day5"
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
   Name = "security-group"
 }
}

output "security-group" {
  description = "security group id"
  value       = aws_security_group.my-security-group.id
}

output "security-group-name" {
  description = "security group name"
  value       = aws_security_group.my-security-group.name
}