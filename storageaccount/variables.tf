variable "base_name" {
    type = string
    description = "Base name"
}

variable "location" {
    type = string
    description = "Location of the resource"
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