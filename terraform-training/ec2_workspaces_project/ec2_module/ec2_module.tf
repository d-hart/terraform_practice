variable "amiid" {
    type = string
    default = "ami-0947d2ba12ee1ff75"
}

module "shared_vars" {
    source = "../shared_vars"
}

variable "sg_id" {}
variable "ec2_name" {
    default = "EC2_Name_Instance_${module.shared_vars.env_suffix}"
}

resource "aws_instance" "terraform_ec2_instance" {
    ami   = var.amiid
    instance_type = "t2.micro"
    key_name = "durell_test"
    vpc_security_group_ids = [var.sg_id]

    tags = {
        Name = var.ec2_name
    }
}