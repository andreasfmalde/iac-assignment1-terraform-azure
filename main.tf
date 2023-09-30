
module "StorageAccount" {
    source = "./storageaccount"
    base_name = "${var.base_name}storage"
    location = var.location
    sa-account-tier = var.sa-account-tier
    sa-account-replication-type = var.sa-account-replication-type
    sa-container-access-type = var.sa-container-access-type
    
}

module "KeyVault" {
    source = "./keyvault"
    base_name = "${var.base_name}vault"
    location = var.location
    keyvalt_SKU = var.keyvalt_SKU
    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions
    storage_permissions = var.storage_permissions
    kv_secret_login_name = var.kv_secret_login_name
    kv_secret_login_username = var.kv_secret_login_username
    kv_secret_login_password = var.kv_secret_login_password
    kv_secret_sa_access_name = var.kv_secret_sa_access_name
    kv_secret_sa_access_value = module.StorageAccount.Storage_account_access_key
}

module "Network" {
    source = "./network"
    base_name = "${var.base_name}-network"
    location = var.location
    addr_space = var.addr_space
    dns-server = var.dns-server
    subnet-prefixes = var.subnet-prefixes
    security_rule_direction = var.security_rule_direction
    security_rule_access = var.security_rule_access
    security_rule_protocol = var.security_rule_protocol
    security_rule_source_port = var.security_rule_source_port
    security_rule_dest_port = var.security_rule_dest_port
    security_rule_source_address = var.security_rule_source_address
    security_rule_dest_address = var.security_rule_dest_address
}

module "VM" {
    source = "./vm"
    base_name = "${var.base_name}-machine"
    location = var.location
    subnet_id = module.Network.subnet_id
    nic_ip_configuration_name = var.nic_ip_configuration_name
    nic_ip_configuration_private_IP = var.nic_ip_configuration_private_IP
    VM_size = var.VM_size
    keyvault_id = module.KeyVault.KeyVaultID
    keyvault_login_secret_name = module.KeyVault.LoginKeyVaultName
    OS_caching = var.OS_caching
    OS_StorageAccount_type = var.OS_StorageAccount_type
    source_image_sku = var.source_image_sku
  
}

output "PublicIP" {
  value = module.VM.PublicIP
}