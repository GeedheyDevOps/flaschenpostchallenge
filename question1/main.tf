resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.azure_region
  tags     = local.tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
  tags = local.tags
}

resource "azurerm_storage_container" "account_container" {
  name                  = var.account_container
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}