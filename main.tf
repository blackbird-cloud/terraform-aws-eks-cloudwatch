terraform {
  required_providers {
    aws = {
      version = "4.20.1"
      source  = "hashicorp/aws"
    }
    helm = {
      version = "2.4.1"
      source  = "hashicorp/helm"
    }
    kubernetes = {
      version = "2.7.1"
      source  = "hashicorp/kubernetes"
    }
  }
  required_version = ">= 1"
}
