data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}

locals {
  cluster_oidc_issuer = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}

module "cloudwatch_log_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 4"

  name        = var.name
  path        = "/cloudwatch_log/"
  description = "Cloudwatch log Policy ${var.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:CreateLogGroup",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:PutRetentionPolicy"
            ],
            "Resource": "${module.cluster_log_group.cloudwatch_log_group_arn}:*"
        }
    ]
}
EOF
}
