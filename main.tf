locals {
  name = "${var.az_name}-${terraform.workspace}"
  #tags = merge(var.az_tag_project, {"env" = terraform.workspace, "app" = local.name})
}

module "base_infra" {
  source = "./base_infra"

  az_tag_environment = var.az_tag_environment
  az_tag_project     = var.az_tag_project

  az_location            = var.az_location
  az_resource_group_name = "RG-${local.name}"

  az_virtual_network_name          = "VNET-${local.name}"
  az_virtual_network_address_space = var.az_virtual_network_address_space

  az_subnet_1_name           = "SUBNET-${local.name}"
  az_subnet_1_address_prefix = var.az_subnet_1_address_prefix
}

module "aks"{
  source = "./aks"
  
  aks_cluster_name  = "AKS-${local.name}"
  az_location   = var.az_location
  az_resource_group_name = module.base_infra.resource_group_name
  aks_version = var.aks_version
  
  aks_system_node_name  = var.aks_system_node_name
  aks_system_node_count = var.aks_system_node_count
  aks_system_node_vm_size = var.aks_system_node_vm_size
  aks_system_node_node_type = var.aks_system_node_node_type
  aks_system_node_labels = var.aks_system_node_labels
  aks-subnet_id = module.base_infra.subnet_1_id

  aks_load_balancer_sku = var.aks_load_balancer_sku
  aks_network_plugin = var.aks_network_plugin

  aks_identity_type = var.aks_identity_type

  #aks_appId = 
  #aks_password = 

}

module "helm"{
  source = "./helm"

  jenkins_admin_password = var.jenkins_admin_password

}


/*
module "jenkins_vm" {
  source = "./vm"

  az_tag_environment = var.az_tag_environment
  az_tag_project     = var.az_tag_project

  az_location            = var.az_location
  az_resource_group_name = "RG-${local.name}"

  az_virtual_network_name          = "VNET-${local.name}"
  az_virtual_network_address_space = var.az_virtual_network_address_space

  az_subnet_1_name           = "SUBNET-${local.name}"
  az_subnet_1_address_prefix = var.az_subnet_1_address_prefix

  az_nsg_1_name = "NSG1-${local.name}"

  az_public_ip_1_name = "PUB_IP1-${local.name}"
  az_public_ip_1_type = var.az_public_ip_1_type
  az_public_ip_1_sku  = var.az_public_ip_1_sku

  az_net_int-1 = "NET_INT1-${local.name}"

  #az_storage_account_1_name             = "storzf235879413"
  az_storage_account_1_name             = "stor${lower(replace(local.name, "-", ""))}"
  az_storage_account_1_account_tier     = var.az_storage_account_1_account_tier
  az_storage_account_1_kind             = var.az_storage_account_1_kind
  az_storage_account_1_replication_type = var.az_storage_account_1_replication_type
  az_storage_account_1_acces_tier       = var.az_storage_account_1_acces_tier
  az_storage_account_1_min_tls_version  = var.az_storage_account_1_min_tls_version

  az_storage_conainer_1_name         = "sc1${lower(local.name)}"
  #az_storage_conainer_1_name         = "sc1${local.name}"
  az_storage_container_1_access_type = var.az_storage_container_1_access_type

  az_linux_virtual_machine_1_name           = "VM1-${local.name}"
  az_virtual_machine_1_size                 = var.az_virtual_machine_1_size
  az_linux_virtual_machine_1_computer_name  = var.az_linux_virtual_machine_1_computer_name
  az_virtual_machine_1_admin_user_name      = var.az_virtual_machine_1_admin_user_name
  az_virtual_machine_1_admin_user_password  = var.az_virtual_machine_1_admin_user_password
  az_virtual_machine_1_storage_account_type = var.az_virtual_machine_1_storage_account_type

  cloudflare_zone_id  = "a2e568d712316a47c0acaecaa9aec69e"

}

*/