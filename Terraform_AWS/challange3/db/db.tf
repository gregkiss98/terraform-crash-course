resource "aws_instance" "db_server" {
  ami = "ami-07ce6ac5ac8a0ee6f"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]

  tags = {
    Name = "DB server"
  }
}

output "PrivateIP_DB_server" {
  value = aws_instance.db_server.private_ip
}