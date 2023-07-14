provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/24"

    tags = {
      Name = var.VPC_Name
    }
}

variable "VPC_Name" {
  type = string
  default = "TerraformVPC"
}