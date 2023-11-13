# ---------------------
# EKS Cluster
# ---------------------
variable "cluster_name" {
  type        = string
  description = "K8s cluster name"
  default     = "terraform"
}

variable "cluster_version" {
  type        = string
  description = "K8s cluster version"
  default     = "1.28"
}

# ---------------------
# AWS
# ---------------------
variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-north-1"
}
