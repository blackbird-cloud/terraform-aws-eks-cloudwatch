output "cloudwatch_log_group" {
  value = module.cluster_log_group
  description = "Cloudwatch log group that receives all logs."
}

output "iam_role" {
  value = module.iam_role
  description = "IAM role used by the helm chart dispatching logs to Cloudwatch."
}
