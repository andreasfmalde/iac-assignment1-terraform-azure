#Base variables - used in the whole infrastructure
base_name = "afmoppg1"
location = "West Europe"
# Network interface card variables
nic_ip_configuration_name = "internal"
nic_ip_configuration_private_IP = "Dynamic"
# Virtual machine variables
VM_size = "Standard_F2"
OS_caching="ReadWrite"
OS_StorageAccount_type="Standard_LRS"
source_image_sku = "20_04-lts"
# KeyVault variables
keyvalt_SKU="standard"
key_permissions = ["Create","Get","Purge","Delete","List","Update"]
secret_permissions = ["Get","List","Purge","Delete","Set","Recover","Restore"]
storage_permissions = ["Get","List","Delete"]
# Example credentials stored in KeyVault and used on the VM
kv_secret_login_username = ""
kv_secret_login_password = ""
# Storage Account variables
sa-account-tier = "Standard"
sa-account-replication-type = "LRS"
sa-container-access-type ="private"
# Virtual Network variables
addr_space = ["10.0.0.0/16"]
dns-server = ["10.0.0.4","10.0.0.5"]
#Subnet
subnet-prefixes = ["10.0.1.0/24"]
#Network security rule variables to open SSH on port 22 for the NTNU IP address 
security_rule_direction = "Inbound"
security_rule_access = "Allow"
security_rule_protocol = "Tcp"
security_rule_source_port = "*"
security_rule_dest_port = "22"
# IP adress to open port for
security_rule_source_address = ""
security_rule_dest_address = "*"