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

provider "aws" {
  region     = "us-east-1"
}
resource "aws_vpc" "vpc"{
  source = "terraform-aws-modules/vpc/aws"

  name = "sample"
  cidr_block = "10.0.0.0/16"

  availability_zone = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name = "sample"
  }
}

resource "aws_eip" "nat" {
  count = 3

  vpc = true
}
