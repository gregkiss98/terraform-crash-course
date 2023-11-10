module "sgmodule" {
  source = "../modules"
}

resource "aws_instance" "web" {
  ami                    = "ami-0ca285d4c2cda3300"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id] //this will read the VPC sec. gro. ID
}

output "sg_id_output" {
  value = module.sgmodule.sg_id //Format: <module name>.<output name>
}