variable "deploy_environment" {
    type        = bool
    description = "Optionally Create Keys"
}

variable "deploy_storage" {
    type        = bool
    description = "Optionally Create Keys"
}

resource "aws_s3_bucket" "bucket" {
    count   = var.deploy_environment || var.deploy_storage ? 1 : 0
    bucket  = "tinfoilbucket-9999-1111"
}