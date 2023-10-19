provider "aws" {
  region = "eu-central-1"
}

//create Elastic IP
resource "aws_eip" "myEIP" {
  domain = "vpc"
}

//create a Security Group
resource "aws_security_group" "mySecurityGroup" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.myEIP.public_ip}/32"] //reference myEIP public address. It needs '"{}"/32' because it would throw an error.
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}