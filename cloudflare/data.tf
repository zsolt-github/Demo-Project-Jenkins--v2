data "azurerm_public_ip" "aks_outgoing" {
  name                = join("", (regex("([^/]+)$", join("", azurerm_kubernetes_cluster.aks.network_profile[0].load_balancer_profile[0].effective_outbound_ips))))
  resource_group_name = var.az_resource_group_name
}