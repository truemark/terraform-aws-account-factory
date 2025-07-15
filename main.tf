provider "aws" {
  region = var.region
}

# Lookup launch paths for product
data "aws_servicecatalog_launch_paths" "paths" {
  product_id = var.product_id
}

# Get the active provisioning artifact
data "aws_servicecatalog_provisioning_artifacts" "artifacts" {
  product_id = var.product_id
}

locals {
  artifact_id = one([
    for artifact in data.aws_servicecatalog_provisioning_artifacts.artifacts.provisioning_artifact_details :
    artifact.id if artifact.active
  ])
}

resource "aws_servicecatalog_provisioned_product" "account" {
  name                     = var.account_name
  product_id               = var.product_id
  provisioning_artifact_id = local.artifact_id
  path_id                  = data.aws_servicecatalog_launch_paths.paths.summaries[0].path_id

  provisioning_parameters {
    key   = "AccountEmail"
    value = var.account_email
  }

  provisioning_parameters {
    key   = "AccountName"
    value = var.account_name
  }

  provisioning_parameters {
    key   = "ManagedOrganizationalUnit"
    value = var.organizational_unit
  }

  provisioning_parameters {
    key   = "SSOUserFirstName"
    value = var.sso_first_name
  }

  provisioning_parameters {
    key   = "SSOUserLastName"
    value = var.sso_last_name
  }

  provisioning_parameters {
    key   = "SSOUserEmail"
    value = var.sso_user_email
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [tags]
  }
}