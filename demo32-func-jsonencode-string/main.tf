locals {
 a_jsonencode = jsonencode({ "hello" = "world" })
}


output "a_jsonencode" {
 value = local.a_jsonencode
}