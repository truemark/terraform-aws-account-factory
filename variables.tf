variable "region" {
  description = "AWS region to provision the account"
  type        = string
}

variable "account_email" {
  description = "Email address for the new AWS account"
  type        = string
}

variable "account_name" {
  description = "Name of the new AWS account"
  type        = string
}

variable "organizational_unit" {
  description = "Organizational Unit under which the account will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the provisioned product"
  type        = map(string)
  default     = {}
}

variable "product_id" {
  description = "AWS Service Catalog product ID for Account Factory"
  type        = string
}

variable "sso_first_name" {
  description = "First name of the new AWS account SSO user"
  type        = string
}
variable "sso_last_name" {
  description = "Last name of the new AWS account SSO user"
  type        = string
}
variable "sso_user_email" {
  description = "Email address of the new AWS account SSO user"
  type        = string
}