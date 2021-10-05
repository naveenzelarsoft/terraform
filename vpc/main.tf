#terraform {
#  backend "remote" {
#    organization = "naveen5035"
#
#    workspaces {
#      name = "sample"
#    }
#  }
#required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 3.27"
#    }
#  }
#
#  required_version = ">= 0.14.9"
#}
#
#provider "aws" {
#  region     = "us-east-1"
#}
#
#resource "aws_vpc" "development" { #1
#  cidr_block = "10.0.0.0/16" #2
#
#  tags = {
#    Environment = "development" #3
#  }
#}
#
#resource "aws_subnet" "private" { #1
#  vpc_id     = aws_vpc.development.id #2
#  cidr_block = "10.0.1.0/24" #3
#
#  tags = {
#    Environment = "development"
#    Access = "private"
#  }
#}
#
#resource "aws_subnet" "public" {
#  vpc_id     = aws_vpc.development.id
#  cidr_block = "10.0.2.0/24"
#
#  tags = {
#    Environment = "development"
#    Access = "public"
#  }
#}
#
#resource "aws_internet_gateway" "igw" { #1
#  vpc_id = aws_vpc.development.id
#
#  tags = {
#    Environment = "development"
#  }
#}
#
#resource "aws_route_table" "public" { #2
#  vpc_id = aws_vpc.development.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.igw.id
#  }
#  tags = {
#    Environment = "development"
#  }
#}
#
#resource "aws_route_table_association" "public" { #3
#  subnet_id      = aws_subnet.public.id
#  route_table_id = aws_route_table.public.id
#}
#
#resource "aws_eip" "nat" { #1
#  vpc      = true
#}
#
#resource "aws_nat_gateway" "ngw" { #2
#  allocation_id = aws_eip.nat.id #3
#  subnet_id = aws_subnet.public.id #4
#}
#
#resource "aws_route_table" "private" { #5
#  vpc_id = aws_vpc.development.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    nat_gateway_id = aws_nat_gateway.ngw.id #6
#  }
#
#  tags = {
#    Environment = "development"
#  }
#}
#
#resource "aws_route_table_association" "private" { #7
#  subnet_id = aws_subnet.private.id
#  route_table_id = aws_route_table.private.id
#}