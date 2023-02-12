resource "helm_release" "helm-jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  #snamespace  = module.aks.kubernetes_namespace.k8s-ns-jenkins.metadata.0.name
  #namespace  = kubernetes_namespace.k8s-ns-jenkins.metadata.0.name
  #depends_on = [azurerm_kubernetes_cluster_node_pool.aks-worker-pool-1]


  values = [
    "${file("./helm/jenkins-values.yaml")}"
  ]

  set {
    name  = "controller.numExecutors"
    value = 2
  }

  set_sensitive {
    name  = "controller.adminPassword"
    value = var.jenkins_admin_password
  }

  set {
    name  = "controller.serviceType"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.cloudName"
    value = "Zsolt-Kubernetes"
  }

  set {
    name  = "agent.enabled"
    value = true
  }

  set {
    name  = "agent.podName"
    value = "jenkins-agent"
  }

}