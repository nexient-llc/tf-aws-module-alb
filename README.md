# tf-aws-module-alb

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

The module creates an Application Load Balancer.

##
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.34.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.load_balancer_redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the application. | `string` | n/a | yes |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix to other resources. | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Application Name running in ECS Task. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnetnet ID's for the Load Balancer to use. | `list(string)` | n/a | yes |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Path to check App Health (e.g.; /, /health) | `string` | `"/"` | no |
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port of Application | `string` | `80` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ARN of the ACM cert | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources created | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | ALB DNS Name |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | ALB Zone ID |
| <a name="output_arn"></a> [arn](#output\_arn) | ALB ARN |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | ALB Target Group ARN |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | ALB Security Group, Allow 443 |
| <a name="output_sg_redirect_id"></a> [sg\_redirect\_id](#output\_sg\_redirect\_id) | ALB Allow port 80 redirect to 443 |
| <a name="output_application_sg_id"></a> [application\_sg\_id](#output\_application\_sg\_id) | Application Security Group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
