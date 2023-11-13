terraform {
  required_providers {
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

locals {
  k8s_config_path = "~/.kube/config"
}

provider "kubernetes" {
  config_path = local.k8s_config_path
}

provider "helm" {
  kubernetes {
    config_path = local.k8s_config_path
  }
}

