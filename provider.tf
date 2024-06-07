terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
variable "AWS_ACCESS_KEY"{
  
}
variable "AWS_SECRET_ACCESS_KEY"{
  
}
