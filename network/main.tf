resource "azurerm_resource_group" "net-rg" {
    name = "${var.base_name}-rg"
    location = var.location
}

resource "azurerm_network_security_group" "net-nsg" {
  name                = "${var.base_name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.net-rg.name

  security_rule {
    name                       = "${var.base_name}-nsg-secrule"
    priority                   = 100
    direction                  = var.security_rule_direction
    access                     = var.security_rule_access
    protocol                   = var.security_rule_protocol
    source_port_range          = var.security_rule_source_port
    destination_port_range     = var.security_rule_dest_port
    source_address_prefix      = var.security_rule_source_address
    destination_address_prefix = var.security_rule_dest_address
  }
}

resource "azurerm_virtual_network" "net-vnet" {
  name                = "${var.base_name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.net-rg.name
  address_space       = var.addr_space
  dns_servers         = var.dns-server
}

resource "azurerm_subnet" "net-sn" {
  name                 = "${var.base_name}-sn"
  resource_group_name  = azurerm_resource_group.net-rg.name
  virtual_network_name = azurerm_virtual_network.net-vnet.name
  address_prefixes     = var.subnet-prefixes
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.net-sn.id
  network_security_group_id = azurerm_network_security_group.net-nsg.id
}