resource "aws_security_group" "ec2-sg" {
  name = "myec2-sg"

  ingress {
    description = "allow inbound from secret application"
    #from_port = 8443 //this is want we don't want, we can change it to a variable
    //from_port   = var.app_port
    //to_port     = var.app_port //but this is something that is easily overridden acidentally. Instead we create 'local' variables
    from_port   = local.app_port
    to_port     = local.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "elb-sg" {
  name = "myelb-sg"


  ingress {
    description = "Allow Inbound from Secret Application"
    from_port   = local.app_port
    to_port     = local.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  app_port = "44"
}