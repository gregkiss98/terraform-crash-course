resource "aws_instance" "ec2" {
  ami = "ami-0b9094fa2b07038b8"
#  instance_type = "t2.micro" //this way, this is hardcoded and cannot be changed when called in module
#  instead, you can create a variable
  instance_type = var.instance_type  
}