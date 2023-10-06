/*

provider "aws" {
  region     = "eu-central-1"
}

resource "aws_iam_user" "lb" {
  name = var.usernumber //this is a variable defined in "variables.tf"
  path = "/system/"
}

*/