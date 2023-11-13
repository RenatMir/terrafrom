terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.25.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
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
