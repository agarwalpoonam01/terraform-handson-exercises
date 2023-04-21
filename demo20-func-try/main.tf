locals {
 map_var = {
   test = "this"
 }
 try1 = try(local.map_var.test, "fallback")
}

output "try1" {
 value = local.try1
}