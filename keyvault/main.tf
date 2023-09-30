data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "kv-rg" {
  name     = "${var.base_name}-rg"
  location = var.location
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_key_vault" "kv-kv" {
  name                        = "${var.base_name}kv${random_string.random.result}"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.kv-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.keyvalt_SKU

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions
    storage_permissions = var.storage_permissions
  }
}

resource "azurerm_key_vault_secret" "kv_secret_vm_details" {
  name         = var.kv_secret_login_name
  value        = tostring(jsonencode(local.login))
  key_vault_id = azurerm_key_vault.kv-kv.id
}

resource "azurerm_key_vault_secret" "kv_secret_sa_access" {
  name         = var.kv_secret_sa_access_name
  value        = var.kv_secret_sa_access_value
  key_vault_id = azurerm_key_vault.kv-kv.id
}