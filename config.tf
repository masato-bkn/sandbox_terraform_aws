terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.54.0"
    }
  }

  backend "s3" {
    region = "ap-northeast-1"
    bucket = "ft-state-mst"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
