terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    helm = {
      source  = "hashicorp/helm"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {}

provider "helm" {
  kubernetes {}
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "azs_available" {
  state = "available"
}
