provider "aws" {
  region = "eu-central-1"
}

module "db_server" {
  source = "./db"
}

module "web_server" {
  source = "./web"
}

output "PrivateIP_DB_server" {
  value = module.db_server.private_ip
}
