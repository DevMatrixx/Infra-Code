terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.75.0"
        }
    }
        backend "azurerm" {
            storage_account_name = "brijendrastoragel"
            resource_group_name = "Todoapp-RG"
            container_name = "starbuckscontainer"
            key = "terraform.tfstate"

        }
    
}
provider "azurerm"{
    features {}
    subscription_id = "ba58d5e6-0957-437c-9efe-dc7469a93475"
}