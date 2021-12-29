provider "aws" {
    region = "us-east-1"
    profile = "nonprod-com"
}

module "sg_module" {
    source = "./sg_module"
}

module "ec2_module" {
    sg_id = module.sg_module.sg_id_output
    ec2_name = "EC2 Instance From Module"
    source = "./ec2_module"
}