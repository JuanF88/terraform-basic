// Local Variables ////////////////////////////////////////

locals {
  resource_group_name = "grp-01"
  location            = "Brazil South"
  virtual_network = {
    name          = "vnTerraform"
    address_space = "10.0.0.0/16"
  }

}