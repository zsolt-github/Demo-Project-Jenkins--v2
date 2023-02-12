resource "azurerm_resource_group" "azure-jenkins-rg" {
  location = var.az_location
  name     = var.az_resource_group_name
  
  tags = {
    "ResourceType" = "Resrouce Group"
    "Evironment"   = var.az_tag_environment
    "Project"      = var.az_tag_project
  }
}


resource "azurerm_virtual_network" "azure-jenkins-vnet" {
  name                = var.az_virtual_network_name
  resource_group_name = azurerm_resource_group.azure-jenkins-rg.name
  location            = var.az_location
  address_space       = [var.az_virtual_network_address_space]
  depends_on          = [azurerm_resource_group.azure-jenkins-rg]

  tags = {
    "ResourceType" = "Virtual Network"
    "Environment"  = var.az_tag_environment
  }  
}


resource "azurerm_subnet" "azure-subnet-1" {
  name                 = var.az_subnet_1_name
  resource_group_name  = azurerm_resource_group.azure-jenkins-rg.name
  virtual_network_name = azurerm_virtual_network.azure-jenkins-vnet.name
  address_prefixes     = [var.az_subnet_1_address_prefix]
  depends_on           = [azurerm_virtual_network.azure-jenkins-vnet]
}
