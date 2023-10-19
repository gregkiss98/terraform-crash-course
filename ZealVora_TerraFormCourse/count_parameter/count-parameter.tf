provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"
  count         = 3 //it does create 3 different instances
}

//this will create 5 users, each with the same name
/*
resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  count = 5 
  path = "/system/"
} */

//this will create 5 users, with different names (adds .0-4 to the end)
/*
resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"
  count = 5 
  path = "/system/"
} */

//this will create 5 users, with different names (custom)
resource "aws_iam_user" "lb" {
  name  = var.elb_names[count.index]
  count = 3 //changed only because we have 3 names
  path  = "/system/"
}

variable "elb_names" {
  type    = list(any)
  default = ["dev-lb", "stage-lb", "prod-lb"]
}