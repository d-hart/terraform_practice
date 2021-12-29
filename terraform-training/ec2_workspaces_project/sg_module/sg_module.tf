variable "vpcid" {
    type = string
    default = "vpc-8dc295f7"
}

module "shared_vars"{
    source = "../shared_vars"
}

variable "sg_name" {
    default = "sg_name_${module.shared_vars.env_suffix}"
}

resource "aws_security_group" "sg_module_creation" {
    name        = var.sg_name
    description = "terraform course sg for ec2 instance"
    vpc_id      = var.vpcid

    ingress {
        description = "Port 22 traffic"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

    egress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

        tags = {
            Name = "allow_ssh"
        }
    }

output "sg_id_output" {
    value = aws_security_group.sg_module_creation.id
}
