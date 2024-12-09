data "azurerm_resource_group" "pirview_rf" {
  provider = azurerm.default-provider
  name     = local.default-provider
}