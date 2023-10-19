resource "aws_instance" "ec2" {
  ami = "ami-0b9094fa2b07038b8"
  instance_type = "t2.micro"  
}