resource "aws_instance" "web_server" {
  ami = "ami-07ce6ac5ac8a0ee6f"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
  user_data = file("server-script.sh")
  tags = {
    Name = "WEB server"
  }
}
