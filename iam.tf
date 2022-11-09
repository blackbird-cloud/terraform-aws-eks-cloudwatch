module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.10.1"

  create_role = true

  role_name = var.name

  provider_url = local.cluster_oidc_issuer

  role_policy_arns = [
    module.cloudwatch_log_policy.arn
  ]

  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:${var.name}"]
}

resource "aws_iam_policy_attachment" "fargate-logging" {
  count = var.fargate_logging_enabled ? 1 : 0

  name       = "eks-fargate-logging policy"
  roles      = [var.fargate_logging_iam_role_name]
  policy_arn = module.cloudwatch_log_policy.arn
}
