resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.az_location
  resource_group_name = var.az_resource_group_name
  kubernetes_version  = var.aks_version
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name                = var.aks_system_node_name
    node_count          = var.aks_system_node_count
    vm_size             = var.aks_system_node_vm_size
    type                = var.aks_system_node_node_type
    node_labels         = var.aks_system_node_labels
    vnet_subnet_id      = var.aks-subnet_id
  
    enable_auto_scaling = false
  }

  network_profile {
    load_balancer_sku = var.aks_load_balancer_sku
    network_plugin    = var.aks_network_plugin
    #load_balancer_sku = "standard"
    #network_plugin    = "kubenet" 
  }

  identity {
    type = var.aks_identity_type
    #type = "SystemAssigned"
  }

/*
  service_principal {
    client_id     = var.aks_appId
    client_secret = var.aks_password
  }

  role_based_access_control {
    enabled = true
  }
*/

  tags = var.aks_system_node_labels
}


resource "kubernetes_namespace" "k8s-ns-jenkins" {
  metadata {
    name = "jenkins"
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}