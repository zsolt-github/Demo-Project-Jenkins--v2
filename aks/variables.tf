# --- Variables for the Azure Resource Group -------------------------

variable "az_location" {
    type        = string
    description = "Location of the resources in Azure."
    default     = "UKSouth"
}

variable "az_resource_group_name" {
    type        = string
    description = "Resource Group name in Azure."
}

variable "aks-subnet_id" {
    type        = string
    description = "Subnet ID."
}

# --- Variables for the Azure Kubernetes Cluster -------------------------

variable "aks_cluster_name" {
    type = string
    description = "Name of the Kubernetes cluster in Azure."
}

variable "aks_version" {
    type = string
    description = "Kubernetes version."
}



# --- Variables for the Azure Kubernetes System node -------------------------

variable "aks_system_node_name" {
    type = string
    description = "Name of Kubernetes system node."
}

variable "aks_system_node_count" {
    type = number
    description = "Number of Kubernetes system node."
}

variable "aks_system_node_vm_size" {
    type = string
    description = "VM type of Kubernetes system node."
}

variable "aks_system_node_node_type" {
    type = string
    description = "Kubernetes Node Type of the system node."
}

variable "aks_load_balancer_sku" {
    type = string
    description = "Kubernetes Load Balancer type."
}

variable "aks_network_plugin" {
    type = string
    description = "Kubernetes Network Plugin."
}

variable "aks_identity_type" {
    type = string
    description = "Kubernetes Network Plugin."
}

variable "aks_system_node_labels" {
    type = map(string)
    description = "Kubernetes Node Labels for the system node."
}



# --- Variables for the Azure Kubernetes Worker node 1 -------------------------

variable "aks_worker_node_1_name" {
    type = string
    description = "Name of Kubernetes system node."
}

variable "aks_worker_node_1_vm_size" {
    type = string
    description = "VM type of Kubernetes worker node 1."
}

variable "aks_worker_node_1_count" {
    type = number
    description = "Number of Kubernetes nodes in worker node 1."
}

variable "aks_worker_node_1_labels" {
    type = map(string)
    description = "Kubernetes Node Labels for the mointoring node."
}






/*
# --- Variables for Jenkins -------------------------

variable "jenkins_admin_user" {
  type        = string
  description = "Admin user of the Jenkins."
  default     = "admin"
}

variable "jenkins_admin_password" {
  type        = string
  description = "Admin password of the Jenkins."
}

*/