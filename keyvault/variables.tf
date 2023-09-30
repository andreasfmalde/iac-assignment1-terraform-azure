variable "base_name" {
    type = string
    description = "Base name"
}

variable "location" {
    type = string
    description = "Location of the resource"
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
}

variable "kv_secret_sa_access_value" {
    type=string
    description = "Access key of the storage account"
}