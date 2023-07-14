provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec" {
    ami = "ami-07ce6ac5ac8a0ee6f"
    instance_type = "t2.micro"
}