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

output "vm_name" {
  value       = azurerm_linux_virtual_machine.cvm.name
  description = "The name of the confidential VM"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.vm_pip.ip_address
  description = "Public IP address of the confidential VM"
}

output "vm_ssh_command" {
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.vm_pip.ip_address}"
  description = "Convenience SSH command to reach the VM"
}
