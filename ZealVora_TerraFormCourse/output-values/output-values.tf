provider "aws" {
  region = "eu-central-1"
}


//create Elastic IP
resource "aws_eip" "myEIP" {
  domain = "vpc"
}

//output public IP from the created EIP
output "myEIP_Info" {
  //value = aws_eip.myEIP.public_ip

  //we can customize the output
  value = "https://${aws_eip.myEIP.public_ip}:8080"
  //value can be used in different projects
}