variable "base_name" {
    type = string
    description = "Base name of the entire infrastructure setup"
}

variable "location" {
  type        = string
  description = "Location of the resource"
}


variable "nic_ip_configuration_name" {
  type        = string
  description = "IP configuration name"
}

variable "nic_ip_configuration_private_IP" {
  type        = string
  description = "IP configuration private IP address allocation"
}

variable "VM_size" {
  type        = string
  description = "VM size"
}

variable "OS_caching" {
  type        = string
  description = "OS caching"
}

variable "OS_StorageAccount_type" {
  type        = string
  description = "OS Storrage Account Type"
}

variable "source_image_sku" {
  type        = string
  description = "Source Image SKU"

}
variable "keyvalt_SKU" {
    type = string
    description = "SKU name of key vault"
}

variable "key_permissions" {
    type = list(string)
    description = "List of key permissions for key vault"
}

variable "secret_permissions" {
    type = list(string)
    description = "List of secret permissions for key vault"
}

variable "storage_permissions" {
    type = list(string)
    description = "List of storage permissions for key vault"
}

variable "kv_secret_login_name" {
    type = string
    description = "Name of the secret holding login credentials to the VM"
    default = "VMLogin"
}

variable "kv_secret_login_username"{
    type = string
    description = "Login username of VM"
}
variable "kv_secret_login_password"{
    type = string
    description = "Login username of VM"
}

variable "kv_secret_sa_access_name" {
    type = string
    description = "Name of the secret holding storage account access link"
    default = "SAAccess"
}
variable "sa-account-tier" {
    type = string
    description = "Storage Account Tier"
}

variable "sa-account-replication-type" {
    type = string
    description = "Storage account replication type"
}

variable "sa-container-access-type" {
    type = string
    description = "Storage Container access type"
}

variable "addr_space" {
    type = list(string)
    description = "List of address spaces in vnet"
}

variable "dns-server" {
    type = list(string)
    description = "List of DNS server IPs"
}


variable "subnet-prefixes" {
    type = list(string)
    description = "List of subnet prefixes"
}
variable "security_rule_direction" {
    type = string
    description = "Security rule direction"
}

variable "security_rule_access" {
    type = string
    description = "Security rule access"
}

variable "security_rule_protocol" {
    type = string
    description = "Security rule protocol"
}

variable "security_rule_source_port" {
    type = string
    description = "Security rule source port range"
}

variable "security_rule_dest_port" {
    type = string
    description = "Security rule destination port range"
}

variable "security_rule_source_address" {
    type = string
    description = "Security rule source address prefix"
}

variable "security_rule_dest_address" {
    type = string
    description = "Security rule destination address prefix"
}