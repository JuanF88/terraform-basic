<<<<<<< HEAD

/*
resource "azurerm_availability_set" "appset" {
  name                = "appset"
  location            = local.location
  resource_group_name = local.resource_group_name

  platform_fault_domain_count = 3
  platform_update_domain_count = 3

  depends_on = [ azurerm_resource_group.grp-01 ]
}

=======

/*
resource "azurerm_availability_set" "appset" {
  name                = "appset"
  location            = local.location
  resource_group_name = local.resource_group_name

  platform_fault_domain_count = 3
  platform_update_domain_count = 3

  depends_on = [ azurerm_resource_group.grp-01 ]
}

>>>>>>> d618bd4f32e312ca2676901947554ca89dda2dfc
*/