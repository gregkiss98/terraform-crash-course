variable "usernumber" {
    type = number //explicitly set the type of the variable
    /*
        other types are:
        string, list, map, number
        list: ["mumbai", "budapest", asd"]
        map: { name = "asd", age = "52"}
    */
}

variable "elb_name" {
    type = string
}

variable "az" {
    type = list
}

variable "timeout" {
    type = number
}