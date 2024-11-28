resource "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "keyVault" {
  name                       = "keyVault2312321"
  location                   = local.location
  resource_group_name        = local.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "Set"
    ]
  }
}

/* Key vault secret
resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = "Thepassword@123"
  key_vault_id = azurerm_key_vault.keyVault.id
  depends_on   = [azurerm_key_vault.keyVault]
}
*/