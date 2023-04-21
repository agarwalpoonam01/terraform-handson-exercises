locals {
 string1       = "str1"
 string2       = "str2"
 int1          = 3
 format  = format("This is %s", local.string1)
 format2 = format("%s_%s_%d", local.string1, local.string2, local.int1)
}

output "apply_format" {
 value = local.format
}
output "apply_format2" {
 value = local.format2
}