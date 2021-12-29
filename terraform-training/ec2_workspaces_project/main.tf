provider "aws" {
    region = "us-east-1"
    profile = "nonprod-com"
}

module "sg_module" {
    source = "./sg_module"
}

module "ec2_module_1" {
    sg_id = module.sg_module.sg_id_output
    source = "./ec2_module"
}




