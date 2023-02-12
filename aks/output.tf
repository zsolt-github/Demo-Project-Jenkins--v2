output "aks_id" {
  description = "ID of the Azure Kubernetes cluster"
  value = azurerm_kubernetes_cluster.aks.id
  # sensitive = false
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
  sensitive = true
}

output "aks_client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
  sensitive = true
}

output "aks_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "aks_client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "aks_namespace-jenkins_id" {
  value = kubernetes_namespace.k8s-ns-jenkins.id
  sensitive = true
}