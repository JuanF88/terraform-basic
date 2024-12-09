provider "azapi" {
  alias = "default-provider"
  subscription_id = local.subscription_id
  enable_hcl_output_for_data_source = true
  skip_provider_registration = true
}

provider "azurerm" {
  storage_use_azuread = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
      recover_soft_deleted_key_vaults = true
    }
  }
}