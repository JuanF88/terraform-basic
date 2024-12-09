
//Terraform init
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.13.0"
    }
  }
}

// Provider Configuration

provider "azurerm" {
  subscription_id = "ed650814-527f-4ad3-98f7-9af062cc8adf"
  tenant_id       = "6b99c178-e515-4bb7-bda4-073a8601a463"
  client_id       = "06db7845-49d9-4a99-b5c3-ed940162972d"
  client_secret   = "Ulg8Q~rxMjP.hd9dYGDdfr1mTdJ2Gw0732MMvbIq"
  features {}
}