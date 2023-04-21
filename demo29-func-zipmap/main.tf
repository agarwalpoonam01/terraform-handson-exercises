locals {
 key_zip    = ["a", "b", "c"]
 values_zip = [1, 2, 3]
 zip_map    = zipmap(local.key_zip, local.values_zip)
}

output "zip_map" {
 value = local.zip_map
}