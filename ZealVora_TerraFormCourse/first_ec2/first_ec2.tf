terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" #csak olyan verziót használ ami 5.X-es
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-ec2"
  }
}