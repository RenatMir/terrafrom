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

# ---------------------
# Networking
# ---------------------
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of the VPC to create."
  default     = "10.0.0.0/16"
}
