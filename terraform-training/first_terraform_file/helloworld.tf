provider "aws" {
    region = "us-east-1"
    profile = "nonprod-com"
}

//this is a string variable

variable "firststring" {
    type = string
    default = "this is my first string"
}

variable "multilinestring" {
    type = string
    default = <<EOH
    This is
    a multiline
    string for
    sure!!!!
    EOH
}

output "myfirstoutput" {
    value = "${var.firststring}"
}

output "multilinestring" {
    value = "${var.multilinestring}"
}

// This is the maps example. These are used for dictionaries
variable "mapexample" {
    type = map
    default = {
        "useast" = "ami-1"
        "euwest" = "ami-2"
    }
}

output "mapoutput" {
    value = "${var.mapexample["euwest"]}"
}

// This is the array/list example

variable "mysecuritygrouplist" {
    type = list
    default = ["sg1","sg2","sg3"]
}

output "sgoutput" {
    value = "${var.mysecuritygrouplist}"
}

// This is my boolean example
variable "testbool" {
    default = true
}

output "booloutput" {
    value = "${var.testbool}"
}

//This is my input example
variable "myInputVariable" {
    type = string
}

output "myOutputVariable" {
    sensitive = true
    value = "${var.myInputVariable}"
}