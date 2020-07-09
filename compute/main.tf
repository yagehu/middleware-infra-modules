terraform {
  required_providers {
    aws = "~> 2.0"
  }
}

module "key_pair" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=0.11.0"
  namespace             = var.namespace
  stage                 = var.stage
  name                  = var.name
  ssh_public_key_path   = var.ssh_public_key_path
  generate_ssh_key      = var.generate_ssh_key
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}

module "instance_group" {
  source          = "git::https://github.com/cloudposse/terraform-aws-ec2-instance-group.git?ref=master"
  namespace       = var.namespace
  stage           = var.stage
  name            = var.name
  ami             = var.ami
  ami_owner       = var.ami_owner
  ssh_key_pair    = module.key_pair.key_name
  instance_type   = var.instance_type
  vpc_id          = var.vpc_id
  security_groups = [aws_security_group.compute.id]
  subnet          = var.subnet
  instance_count  = 3
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

