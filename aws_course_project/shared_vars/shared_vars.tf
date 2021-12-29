





locals {
    env = terraform.workspace

    vpcid_env = {
        default = "vpc-05696ab3a711e2b2d"
        staging = "vpc-05696ab3a711e2b2d"
        production = "vpc-05696ab3a711e2b2d"
    }
}