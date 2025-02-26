terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "2da1e32a-7e3a-4497-98eb-7fa16a244301"
}


resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "West US"
}

resource "azurerm_storage_account" "example" {
  name                     = "mysac9873493vs"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}