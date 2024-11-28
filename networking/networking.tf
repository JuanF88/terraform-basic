
// Virtual Network Process ////////////////////////////////////////

resource "azurerm_virtual_network" "vnTerraform" {
  name                = local.virtual_network.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [local.virtual_network.address_space]

  //depends_on = [azurerm_resource_group.grp-01]
}

// Subnets Process ////////////////////////////////////////

resource "azurerm_subnet" "subnets" {
  count                = var.number_of_subnets
  name                 = "Subnet${count.index}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = ["10.0.${count.index + 1}.0/24"]

  depends_on = [azurerm_virtual_network.vnTerraform]
}


//Network security group process ////////////////////////////////////////
//for a Linux VM

resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg1"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = local.network_security_rules
    content {
      name                       = "allow${security_rule.value.destination_port_range}"
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  //depends_on = [azurerm_resource_group.grp-01]
}

//Netwrok security group allowin RDP, necesary when is a Windows VM

/*
resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg1"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "allowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [azurerm_resource_group.grp-01]
}


// Association of the security group ////////////////////////////////////////

resource "azurerm_subnet_network_security_group_association" "ngs1link" {
  count                     = var.number_of_subnets
  subnet_id                 = azurerm_subnet.subnets[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg1.id
  depends_on = [
    azurerm_network_security_group.nsg1,
    azurerm_virtual_network.vnTerraform
  ]
}

*/