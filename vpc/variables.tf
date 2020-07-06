variable "delimiter" {
  description = "Delimiter to be used between namespace, environment, stage, name and attributes."
  type        = string
  default     = "-"
}

variable "namespace" {
  description = "Your organization name or abbreviation."
  type        = string
}

variable "stage" {
  description = "Stage of the infrastructure, e.g. \"prod\", \"staging\", \"dev\"."
  type        = string
}

variable "name" {
  description = "Solution name, eg, \"app\"."
  type        = string
}

variable "attributes" {
  description = "A list of attributes."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}

variable "cidr_block" {
  type        = string
  description = "CIDR block of the VPC."
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones for the region of the VPC."
}
