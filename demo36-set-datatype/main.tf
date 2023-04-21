variable "set" {
  type = set(string)
/*  default = [
    "foo",
    "bar",
  ]
*/
}

output "set" {
  value = var.set
}

/* output "set_first_element" {
  value = var.set
}
*/
output "set_to_list_first_element" {
  value = tolist(var.set)[0]
  
}