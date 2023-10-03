provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "myec2" {
  ami = "ami-0b9094fa2b07038b8"
  instance_type = var.instancetype //it is a variable from variables.tf
  //you can specify variables in CMD with --var="instancetype" too
}