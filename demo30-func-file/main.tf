locals {
  a_file = file("./a_file.txt")
}

output "a_file" {
  value = local.a_file
}