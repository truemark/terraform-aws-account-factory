# terraform-aws-account-factory

## Overview

This Terraform module provisions a new AWS account using AWS Service Catalog's Account Factory. It allows you to specify account details, organizational unit, and SSO user information, while also supporting tagging and customization.

## Requirements

- Terraform `>= 1.0`
- AWS Provider `>= 6.0`

## Providers

- `aws`

## Inputs

| Name                  | Description                                                   | Type         | Default | Required |
|-----------------------|---------------------------------------------------------------|--------------|---------|----------|
| `region`              | AWS region to provision the account                           | `string`     |         | yes      |
| `account_email`       | Email address for the new AWS account                         | `string`     |         | yes      |
| `account_name`        | Name of the new AWS account                                   | `string`     |         | yes      |
| `organizational_unit` | Organizational Unit under which the account will be created   | `string`     |         | yes      |
| `tags`                | Tags to apply to the provisioned product                      | `map(string)`| `{}`    | no       |
| `product_id`          | AWS Service Catalog product ID for Account Factory           | `string`     |         | yes      |
| `sso_first_name`      | First name of the new AWS account SSO user                    | `string`     |         | yes      |
| `sso_last_name`       | Last name of the new AWS account SSO user                     | `string`     |         | yes      |
| `sso_user_email`      | Email address of the new AWS account SSO user                 | `string`     |         | yes      |

## Outputs

| Name                                | Description                          |
|-------------------------------------|--------------------------------------|
| `account_provisioned_product_name`  | Provisioned product name            |
| `provisioned_product_status`        | Provisioned product status          |

## Usage

```hcl
module "account_factory" {
  source                = "./path-to-module"
  region                = "us-east-1"
  account_email         = "example@example.com"
  account_name          = "example-account"
  organizational_unit   = "ou-1234"
  tags                  = {
    Environment = "Production"
    Team        = "DevOps"
  }
  product_id            = "prod-abc123"
  sso_first_name        = "John"
  sso_last_name         = "Doe"
  sso_user_email        = "john.doe@example.com"
}
