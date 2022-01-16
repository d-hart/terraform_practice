provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "example" {
    ami                     = "ami-"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF
    tags = {
        Name = "terraform-example"
    }
}

variable "server_port" {
    description         = "The server port number to be used"
    type                = number
    default             = 8080
}

resource "aws_security_group" "instance" {
    name                = "terraform-example-instance"

    ingress {
        form_port       = var.server_port
        to_port         = var.server_port 
        protocol        = "tcp" 
        cidr_blocks     = ["0.0.0.0/0"] 
    }
}

output "public_ip" {
    value               = aws_instance.example.public_ip
    description         = "The public IP address of the wen server"
}