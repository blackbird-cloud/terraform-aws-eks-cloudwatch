module "eks_cloudwatch" {
  source  = "blackbird-cloud/eks-cloudwatch/aws"
  version = "~> 0.1"

  cluster_name = "my-cluster"
  aws_region   = "eu-central-1"
}
