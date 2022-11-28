output "storage_account_id" {
  description = "The storage account id after creation"
  value       = azurerm_storage_account.storage_account.id
}

output "storage_account_primary_access_key" {
  description = "The Primary access key for the storage account"
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}

output "storage_account_primary_connection_string" {
  description = "The Prmary connection string to the storage account"
  value       = azurerm_storage_account.storage_account.primary_connection_string
  sensitive   = true
}

output "container_id" {
  description = "Container ID"
  value       = azurerm_storage_container.account_container.id
}