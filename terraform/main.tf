terraform {
  required_version = "~> 1.3"
  backend "azurerm" {

  }

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.2"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75"
    }
  }
}