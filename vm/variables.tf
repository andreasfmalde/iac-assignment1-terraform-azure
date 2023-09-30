variable "base_name" {
  type        = string
  description = "Base name"
}

variable "location" {
  type        = string
  description = "Location of the resource"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to connect to"
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


variable "keyvault_id" {
  type        = string
  description = "Key Vault ID"
}
variable "keyvault_login_secret_name" {
  type        = string
  description = "Name of the secret holding login credentials for the VM"
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