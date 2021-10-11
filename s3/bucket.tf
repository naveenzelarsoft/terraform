provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "C:/Users/naveen/.aws/credentials"
  profile                 = "windows"
}
resource "aws_s3_bucket" "bommakanti" {
  bucket = "bommakanti"
}