output "KeyVaultID" {
    value = azurerm_key_vault.kv-kv.id
}

output "LoginKeyVaultName" {
    value = azurerm_key_vault_secret.kv_secret_vm_details.name
}