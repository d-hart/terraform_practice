provider "aws" {
    region = "us-east-1"
    profile = "nonprod-com"
}

variable "vpcid" {
    type = string
    default = "vpc-8dc295f7"
}

resource "aws_security_group" "terraform_ec2_sg" {
    name        = "terraform_ec2_sg"
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

variable "amiid" {
    type = string
    default = "ami-0947d2ba12ee1ff75"
}

resource "aws_instance" "terraform_ec2_instance" {
    ami   = var.amiid
    instance_type = "t2.micro"
    key_name = "durell_test"
    vpc_security_group_ids = [aws_security_group.terraform_ec2_sg.id]

    tags = {
        Name = "Terraform Ec2 Instance"
    }
}