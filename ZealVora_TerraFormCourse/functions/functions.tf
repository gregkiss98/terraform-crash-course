locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "eu-central-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"    = "ami-0323c3dd2da7fb37d"
    "us-west-2"    = "ami-0d6621c01e8c2de2c"
    "eu-central-1" = "ami-0b9094fa2app-b07038b8"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub") //it should be next to the functions.tf file
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region) //lookup retrieves the value of a single element from a map. If not exists, default will be used
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2 // 0-1, 2ig megy (2x csinálja meg)

  tags = {
    Name = element(var.tags, count.index) //element retrieves a single element in the list
  }
}


output "timestamp" {
  value = local.time
}