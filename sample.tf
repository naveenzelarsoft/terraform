resource "aws_instance" "web" {
  ami          = ami-0eb5f3f64b10d3e0e
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}