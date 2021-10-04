provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "terraform" {
  name = "allow_terraform"
  description = "Allow TF inbound traffic"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
   }
  tags = {
    Name = "terraform"
  }
}
resource "aws_instance" "sample" {
  ami          = "ami-0eb5f3f64b10d3e0e"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}