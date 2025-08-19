# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
#comment

provider "azurerm" {
  features {}

  subscription_id = "fad53211-8c45-4e57-bf84-8f7c35bc6193"   # Azure subscription ID
tenant_id       = "1b4eaaad-b887-48cf-8407-e99420eda2fb"         # Azure AD tenant ID
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/22"]
}