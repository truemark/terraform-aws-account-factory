output "account_provisioned_product_name" {
  description = "Provisioned product name"
  value       = aws_servicecatalog_provisioned_product.account.name
}

output "provisioned_product_status" {
  description = "Provisioned product status"
  value       = aws_servicecatalog_provisioned_product.account.status
}

output "provisioned_account_id" {
  description = "The AWS Account ID of the provisioned account"
  value       = aws_servicecatalog_provisioned_product.account.outputs["AccountId"]
}
