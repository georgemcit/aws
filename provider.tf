provider "aws" {
  version = "~> 5.0"
  region  = "us-east-1"
}
provider "aws" {
  region = var.aws_region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
