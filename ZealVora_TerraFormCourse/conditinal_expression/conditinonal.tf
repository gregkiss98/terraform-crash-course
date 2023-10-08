provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "dev" {
    ami = "ami-0b9094fa2b07038b8"
    instance_type = "t2.micro"
    count = var.is-test == true ? 1 : 0
}

resource "aws_instance" "prod" {
    ami = "ami-0b9094fa2b07038b8"
    instance_type = "t2.micro"
    count = var.is-test == false ? 1 : 0
}

// condition ? true_val : false_val

variable "is-test" {}