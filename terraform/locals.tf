// Local Variables ////////////////////////////////////////

locals {
  resource_group_name = "grp-01"
  location            = "Brazil South"
  virtual_network = {
    name          = "vnTerraform"
    address_space = "10.0.0.0/16"
  }
  subscription_id = "ed650814-527f-4ad3-98f7-9af062cc8adf"
  default-provider = "enterprise-domain-prd-eus-001-purview-rg"

}