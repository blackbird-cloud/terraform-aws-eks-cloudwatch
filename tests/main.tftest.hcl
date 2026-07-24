mock_provider "aws" {
  mock_data "aws_eks_cluster" {
    defaults = {
      endpoint = "https://example.eks.amazonaws.com"
      identity = [{ oidc = [{ issuer = "https://oidc.eks.eu-central-1.amazonaws.com/id/EXAMPLE" }] }]
      certificate_authority = [{ data = "dGVzdA==" }]
    }
  }
  mock_data "aws_iam_policy_document" {
    defaults = {
      json = "{}"
    }
  }
}
mock_provider "helm" {}
mock_provider "kubernetes" {}

run "plan" {
  command = plan
  variables {
    cluster_name = "my-cluster"
    aws_region   = "eu-central-1"
  }
}
