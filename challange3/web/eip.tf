resource "aws_eip" "web_server_ip" {
  instance = aws_instance.web_server.PrivateIP_DB_server
}

output "EIP_Web_server" {
  value = aws_eip.web_server.public_ip
}