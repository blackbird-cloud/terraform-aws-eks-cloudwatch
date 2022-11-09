module "cluster_log_group" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/log-group"
  version = "3.2.0"

  name              = var.name
  retention_in_days = var.log_retention_days
}
