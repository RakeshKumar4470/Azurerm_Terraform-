terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "jasmine" {
  name     = "Denver"
  location = "centralindia"
}

resource "azurerm_storage_account" "pride" {
  name                     = "paracute"
  resource_group_name      = "Denver"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "Denver"
    storage_account_name = "paracute"
    container_name       = "bricks"
    key                  = "proud.terraform.tfstate"
  }
}
