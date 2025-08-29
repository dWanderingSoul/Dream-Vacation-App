terraform {
  backend "s3" {
    bucket       = "fatimah-dream-vacation-tfstate"
    key          = "backend/terraform.tfstate"
    region       = "us-east-1"
    dynamodb_table = "fatimah-dream-vacation-locks"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}