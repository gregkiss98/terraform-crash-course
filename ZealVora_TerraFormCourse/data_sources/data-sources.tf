//data sources allow data to be fetched or computed for use elswhere in Terraform config
provider "aws" {
  region     = "eu-central-1"
}
resource "aws_instance" "myec2" {
    ami = data.aws_ami.app_ami
    instance_type = "t2.micro"
}


data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}