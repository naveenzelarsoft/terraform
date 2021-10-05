terraform {
  backend "remote" {
    organization = "naveen5035"

    workspaces {
      name = "sample"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}



