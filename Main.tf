terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg-tf-lanka" {
  name     = "fortune"
  location = "centralindia"
}

resource "azurerm_storage_account" "SA_FT_01" {
  depends_on               = [azurerm_resource_group.rg-tf-lanka]
  name                     = "veg-oil"
  location                 = "centralindia"
  resource_group_name      = "fortune"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
terraform {
    backend "azurerm" {
      resource_group_name  = "fortune"
      storage_account_name = "veg-oil"
      container_name       = "proud"
      key                  = "proud.terraform.tfstate"
    }
  }

