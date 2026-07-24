<!-- BEGIN_TF_DOCS -->
# Terraform Aws Eks Cloudwatch Module
Terraform module to deploy CloudWatch agent on EKS

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

## Example
```hcl
module "eks_cloudwatch" {
  source  = "blackbird-cloud/eks-cloudwatch/aws"
  version = "~> 0.1"

  cluster_name = "my-cluster"
  aws_region   = "eu-central-1"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 3.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_attachment.fargate_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [helm_release.aws_cloudwatch_logs](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_config_map.fargate_log_config](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_namespace.aws_observability](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

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

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2026 [Blackbird Cloud](https://blackbird.cloud)
<!-- END_TF_DOCS -->