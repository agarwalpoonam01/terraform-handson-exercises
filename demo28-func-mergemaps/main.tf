locals {
 b_map = {
   "key1" : "value1",
   "key2" : "value2"
 }
 c_map = {
   "key3" : "value3",
   "key4" : "value4"
 }
 final_map = merge(local.b_map, local.c_map)
}


output "final_map" {
 value = local.final_map
}