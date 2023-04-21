provider "aws" {
  alias = "region-1"
  region = "us-east-1" 
}

provider "aws" {
  alias  = "region-2"
  region = "eu-west-1"
}