provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "sample" {
  ami          = "ami-0eb5f3f64b10d3e0e"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}