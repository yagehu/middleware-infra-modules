variable "namespace" {
  description = "Namespace for the resources."
  type        = string
}

variable "stage" {
  description = "Stage of the resources (e.g. `prod`, `dev`, `staging`)."
  type        = string
}

variable "name" {
  description = "Application name."
  type        = string
}

variable "region" {
  description = "Region."
  type        = string
}

variable "generate_ssh_key" {
  description = "If set to `true`, new SSH key pair will be created."
  type        = bool
}

variable "ssh_key_pair_path" {
  description = "Path to where the generated key pairs will be created."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC."
  type        = string
}

variable "subnet" {
  description = "Subnet ID."
  type        = string
}

variable "ami" {
  description = "The AMI ID of the image."
  type        = string
}

variable "ami_owner" {
  description = "The owner of the AMI."
  type        = string
}

variable "instance_type" {
  description = "The instance type."
  default     = "t2.micro"
}
