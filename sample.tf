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
resource "aws_security_group" "default" {
  name        = "allow_terraform"
  description = "Allow TF inbound traffic"
  vpc_id      = vpc-9947e0e4
  ingress = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]

    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
   }
  ]

}