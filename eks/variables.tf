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

variable "delimiter" {
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
  type        = string
  default     = "-"
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to run."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC the cluster will be in."
  type        = string
}

variable "subnet_ids" {
  description = "A list of public subnet IDs within the specified VPC."
  type        = list(string)
}

variable "region" {
  description = "The AWS region."
  type        = string
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20. Terraform will only perform drift detection if a configuration value is provided."
  type        = number
}

variable "kubernetes_labels" {
  description = "Key-value mapping of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed."
  type        = map(string)
  default     = {}
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "The maximum size of the AutoScaling Group"
  type        = number
}

variable "min_size" {
  description = "The minimum size of the AutoScaling Group"
  type        = number
}

variable "instance_types" {
  type        = list(string)
  description = "Set of instance types associated with the EKS Node Group. Defaults to [\"t3.medium\"]. Terraform will only perform drift detection if a configuration value is provided"
}

variable "oidc_provider_enabled" {
  description = "Create an IAM OIDC identity provider for the cluster, then you can create IAM roles to associate with a service account in the cluster, instead of using `kiam` or `kube2iam`. For more information, see https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html"
  type        = bool
  default     = true
}

variable "local_exec_interpreter" {
  description = "shell to use for local_exec"
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}

variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable. For more information, see https://docs.aws.amazon.com/en_us/eks/latest/userguide/control-plane-logs.html. Possible values [`api`, `audit`, `authenticator`, `controllerManager`, `scheduler`]"
  type        = list(string)
  default     = []
}

variable "cluster_log_retention_period" {
  description = "Number of days to retain cluster logs. Requires `enabled_cluster_log_types` to be set. See https://docs.aws.amazon.com/en_us/eks/latest/userguide/control-plane-logs.html."
  type        = number
  default     = 0
}
