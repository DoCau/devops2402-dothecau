terraform {
  # required_providers {
  #   aws = {
  #     source  = "hashicorp/aws"
  #     version = "~> 5.0" #Match AWS provider version
  #   }
  # }
  backend "s3" {
    bucket = "cau-s3-bucket-dec2"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
