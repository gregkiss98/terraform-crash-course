resource "aws_instance" "myec2" {
    ami = "ami-0b9094fa2b07038b8"
    instance_type = "t2.micro"

    tags = {
        Name = "my-first-ec2"
    }
}

//debugging in CMD can happen with
//TF_LOG= is set to DEBUG, TRACE, INFO WARN or ERROR
//you can put it in a folder with TF_LOG_PATH=''

//validating format with 'terraform fmt' command. It will set indentation for example.

//validate config files with 'terraform validate', including unsupported arguments, undeclared variables etc.