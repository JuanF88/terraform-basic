locals {

  network_security_rules = [
    {
      priority               = 200
      destination_port_range = "3389"
    },
    {
      priority               = 300
      destination_port_range = "80"
    }
  ]
  virtual_network = {
    name          = "vnTerraform"
    address_space = "10.0.0.0/16"
  }
}