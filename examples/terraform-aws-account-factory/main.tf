terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = "af-south-1"
}

module "aws_account_factory" {
  source = "../../"

  region              = "af-south-1"
  account_email       = "9a7f4365-1628-4f17-b262-06947e414e6e@aws.truemark.io"
  account_name        = "account-factory-account"
  organizational_unit = "Sandbox"
  sso_first_name      = "Donald"
  sso_last_name       = "Duck"
  sso_user_email      = "dduck@flinstones.com"

  product_id   = "prod-mxaofbadobv"

  tags = {
    owner = "infra"
  }
}


