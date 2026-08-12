terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.75.0"
    }

  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "bkstterraformstate"
    container_name       = "tfstate"
    key                  = "Dev.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "0f8f3a03-1fbc-4587-9442-3a42f6948e4e"
}
