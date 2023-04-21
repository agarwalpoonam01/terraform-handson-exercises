variable "list" {
    type = list
    default = ["t2.nano", "t2.micro", "t2.medium"]
}
variable "types" {
    type = map
    default = {
        dev = "t2.nano",
        stage = "t2.micro",
        prod = "t2.medium"
    }
}