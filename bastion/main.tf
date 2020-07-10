module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = "-"
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids      = compact(concat(list(aws_security_group.this.id), var.security_groups))
  iam_instance_profile        = aws_iam_instance_profile.this.name
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  tags                        = module.label.tags
}

data "aws_iam_policy_document" "this" {
  statement {
    sid = ""

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "this" {
  name = module.label.id
  path = "/"

  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_instance_profile" "this" {
  name = module.label.id
  role = aws_iam_role.this.name
}

resource "aws_security_group" "this" {
  name        = module.label.id
  vpc_id      = var.vpc_id
  description = "Bastion security group (only SSH inbound access is allowed)."
  tags        = module.label.tags

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = -1
    security_groups = var.security_groups
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

