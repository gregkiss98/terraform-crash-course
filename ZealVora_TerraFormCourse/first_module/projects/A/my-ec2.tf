module "ec2module" {
    source = "../../modules/ec2-modules"
#    we can override the value of instance_type
#    instance_type = "t2.large"
}