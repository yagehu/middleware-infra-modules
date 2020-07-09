terraform {
  required_providers {
    aws = "~> 2.0"
  }
}

module "instance_group" {
  source                = "git::https://github.com/cloudposse/terraform-aws-ec2-instance-group.git?ref=0.4.0"
  namespace             = var.namespace
  stage                 = var.stage
  name                  = var.name
  region                = var.region
  ami                   = var.ami
  ami_owner             = var.ami_owner
  generate_ssh_key_pair = var.generate_ssh_key
  instance_type         = var.instance_type
  vpc_id                = var.vpc_id
  security_groups       = [aws_security_group.compute.id]
  subnet                = var.subnet
  instance_count        = 3
}

resource "aws_security_group" "compute" {
  name        = "compute"
  description = "For all compute nodes."
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from everywhere."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "compute"
  }
}

