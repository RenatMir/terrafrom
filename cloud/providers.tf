terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    helm = {
      source = "hashicorp/helm"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64encode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

provider "helm" {
  kubernetes {}
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}
