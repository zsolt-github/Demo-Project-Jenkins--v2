output "resource_group_name" {
  value = azurerm_resource_group.azure-jenkins-rg.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.azure-jenkins-vnet.name
}

output "subnet_1_id" {
  value = azurerm_subnet.azure-subnet-1.id
}




