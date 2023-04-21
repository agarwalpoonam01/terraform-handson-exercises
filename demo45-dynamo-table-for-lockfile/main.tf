resource "aws_dynamodb_table" "example-dynamodb" {
    name = "terraform-state-lock-dynamodb-table-poonam"
    hash_key = "LockID"
    read_capacity = 10
    write_capacity = 10
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "dynamodb-table-state-lock"
    }
}