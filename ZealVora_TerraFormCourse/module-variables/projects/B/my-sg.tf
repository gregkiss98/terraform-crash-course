module "sgmodule" {
  source = "../../modules/sg"

  //variables in modules/sg/variables.tf can be overridden
  //app_port = "22"
  //this is not something we want, as the user can accidentally override the value. Instead we use 'locals' in sg.tf
}