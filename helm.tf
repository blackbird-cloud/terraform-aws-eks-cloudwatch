resource "helm_release" "aws_cloudwatch_logs" {
  name       = "aws-cloudwatch-logs"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-for-fluent-bit"
  namespace  = "kube-system"

  cleanup_on_fail = true

  values = [
    templatefile("template.yaml",
      {
        role_arn             = module.iam_role.iam_role_arn
        service_account_name = var.name
        log_retention_days   = var.log_retention_days
        log_group_name       = module.cluster_log_group.cloudwatch_log_group_name
        cluster_name         = var.cluster_name
        aws_region           = var.aws_region
      }
    )
  ]
}

