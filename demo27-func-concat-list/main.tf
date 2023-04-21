locals {
 concat_list = concat([1, 2, 3], [4, 5, 6])
}


output "concat_list" {
 value = local.concat_list
}