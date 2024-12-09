module "shared_objects" {
  source           = "git::https://github.com/JuanF88/terraform-modules//azurerm-modules-shared-objects?ref=shared-objects-v1.0.0"
  location_primary = var.location
  environment      = var.environment
}