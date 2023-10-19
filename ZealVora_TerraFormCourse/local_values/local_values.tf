provider "aws" {
  region = "eu-central-1"
}

//local values can help to avoid repeating the same values or expressions multiple times
locals {
  common_tags = {
    Owner   = "DevOps Team"
    Service = "backend"
  }
}

resource "aws_instance" "dev" {
  ami           = "ami-0b9094fa2app-b07038b8"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"
  tags          = local.common_tags

}

resource "aws_ebs_volume" "db-ebs" {
  availability_zone = "eu-central-1"
  size              = 8
  tags              = local.common_tags
}