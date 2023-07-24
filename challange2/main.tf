provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "db_server" {
  ami = "ami-07ce6ac5ac8a0ee6f"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]

  tags = {
    Name = "DB server"
  }
}

resource "aws_instance" "web_server" {
  ami = "ami-07ce6ac5ac8a0ee6f"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
  user_data = file("server-script.sh")
  tags = {
    Name = "WEB server"
  }
}

resource "aws_eip" "web_server_ip" {
  instance = aws_instance.web_server.id
}

resource "aws_security_group" "webtraffic" {
  name ="Allow HTTP and HTTPS"
  
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "ingressrules" {
  type = list(number)
  default = [80,443]
}

variable "egressrules" {
  type = list(number)
  default = [80,443]
}

output "PrivateIP_DB_server" {
  value = aws_instance.db_server.private_ip
}

output "EIP_Web_server" {
  value = aws_eip.web_server.public_ip
}