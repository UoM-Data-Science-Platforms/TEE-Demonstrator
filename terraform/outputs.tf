output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "The created storage account name"
}

output "storage_account_id" {
  value       = azurerm_storage_account.sa.id
  description = "The ID of the storage account"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  description = "The primary blob endpoint"
}
