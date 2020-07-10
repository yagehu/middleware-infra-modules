variable "namespace" {
  description = "Namespace (e.g. `eg` or `cp`)"
  type        = string
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
}

variable "name" {
  description = "Name  (e.g. `app` or `bastion`)"
  type        = string
}

variable "attributes" {
  description = "Additional attributes (e.g. `1`)"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
  type        = map(string, string)
  default     = {}
}

variable "ami" {
  description = "AMI to use"
  type        = string
  default     = "ami-efd0428f"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "A list of CIDR blocks allowed to connect"
  type        = list(string)

  default = [
    "0.0.0.0/0",
  ]
}

variable "security_groups" {
  description = "AWS security group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "Key name"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "AWS subnet ID."
  type        = string
}
