variable "name" {
  default     = "aws-eks-cloudwatch-logs"
  type        = string
  description = "Name for created resources."
}

variable "cluster_name" {
  type        = string
  description = "AWS EKS Cluster name."
}

variable "log_retention_days" {
  type        = number
  default     = 30
  description = "How many days the logs should be retained."
}

variable "fargate_logging_enabled" {
  type        = bool
  default     = false
  description = "Set to true to collect logs from Fargate PODs."
}

variable "fargate_logging_iam_role_name" {
  type        = string
  default     = ""
  description = "Name of the IAM role used by Fargate to send the logs."
}

variable "aws_region" {
  type        = string
  description = "AWS Region used for storing logs."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS Provider detault tags"
}
