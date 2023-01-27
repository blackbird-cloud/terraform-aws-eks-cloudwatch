## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.20.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.4.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.1 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.4.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.7.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch_log_policy"></a> [cloudwatch\_log\_policy](#module\_cloudwatch\_log\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | ~> 4 |
| <a name="module_cluster_log_group"></a> [cluster\_log\_group](#module\_cluster\_log\_group) | terraform-aws-modules/cloudwatch/aws//modules/log-group | 3.2.0 |
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 4.10.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_attachment.fargate_logging](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/resources/iam_policy_attachment) | resource |
| [helm_release.aws_cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [kubernetes_config_map.fargate_log_config](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.1/docs/resources/config_map) | resource |
| [kubernetes_namespace.aws_observability](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.1/docs/resources/namespace) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/4.20.1/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region used for storing logs. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | AWS EKS Cluster name. | `string` | n/a | yes |
| <a name="input_fargate_logging_enabled"></a> [fargate\_logging\_enabled](#input\_fargate\_logging\_enabled) | Set to true to collect logs from Fargate PODs. | `bool` | `false` | no |
| <a name="input_fargate_logging_iam_role_name"></a> [fargate\_logging\_iam\_role\_name](#input\_fargate\_logging\_iam\_role\_name) | Name of the IAM role used by Fargate to send the logs. | `string` | `""` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | How many days the logs should be retained. | `number` | `30` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for created resources. | `string` | `"aws-eks-cloudwatch-logs"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS Provider detault tags | `map(string)` | `{}` | no |
| <a name="input_values"></a> [values](#input\_values) | Additional values to pass into the AWS EKS Cloudwatch helm chart. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#output\_cloudwatch\_log\_group) | Cloudwatch log group that receives all logs. |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM role used by the helm chart dispatching logs to Cloudwatch. |
