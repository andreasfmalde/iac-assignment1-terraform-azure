variable "base_name" {
    type = string
    description = "Base name"
}

variable "location" {
    type = string
    description = "Location of the resource"
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