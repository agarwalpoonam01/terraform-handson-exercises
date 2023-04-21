module "us-east-1" {
  source = "./modules/multi-region"
  providers = {
    aws = aws.region-1
  }
}
module "eu-west-1" {
  source = "./modules/multi-region"
  providers = {
    aws = aws.region-2
  }
}
