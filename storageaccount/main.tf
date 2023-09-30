resource "azurerm_resource_group" "sa-rg" {
  name     = "${var.base_name}-rg"
  location = var.location
}

resource "random_string" "random" {
    length = 6
    upper = false
    special = false
}

resource "azurerm_storage_account" "sa-sa" {
  name                     = "${var.base_name}sa${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.sa-rg.name
  location                 = var.location
  account_tier             = var.sa-account-tier
  account_replication_type = var.sa-account-replication-type

}

resource "azurerm_storage_container" "sa-sc" {
  name                  = "${var.base_name}-sc"
  storage_account_name  = azurerm_storage_account.sa-sa.name
  container_access_type = var.sa-container-access-type
}