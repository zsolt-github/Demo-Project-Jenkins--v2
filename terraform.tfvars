# --- Azure Environment postfix variable -------------------------
az_name            = "Jenkins"
#az_env_postfix     = "Demo-Jenkins-TF"
az_tag_environment = "Demo-Jenkins"
az_tag_project     = "Jenkins"



# --- Azure main variables -------------------------
az_location            = "UKSouth"
az_resource_group_name = "RG-Jenkins-TF"



# --- Azure Virtual Network variables -------------------------
#az_virtual_network_name          = "VNET-Jenkins-TF"
az_virtual_network_address_space = "10.20.0.0/16"



# --- Azure Subnet variables -------------------------
#az_subnet_1_name           = "SN-1-Jenkins-TF"
az_subnet_1_address_prefix = "10.20.1.0/24"

#az_subnet_2_name           = "SN-2-Jenkins-TF"
#az_subnet_2_address_prefix = "10.20.2.0/24"



# --- Azure Network Security Group variables -------------------------
#az_nsg_1_name = "NSG-1-Jenkins-TF"
#az_nsg_2_name = "NSG-2-Jenkins-TF"



# --- Azure Public IP variables -------------------------
#az_public_ip_1_name = "PIP-1-Jenkins-TF"
az_public_ip_1_type = "Dynamic"
az_public_ip_1_sku  = "Basic"



# --- Azure Network Interfaces variables -------------------------
#az_net_int-1 ="NI-1-Jenkins-TF"
#az_net_int-2 ="NI-2-Jenkins-TF"



# --- Azure Storage variables -------------------------
#az_storage_account_1_name             = "sajenkinstf"
az_storage_account_1_kind             = "StorageV2"
az_storage_account_1_account_tier     = "Standard"
az_storage_account_1_replication_type = "LRS"
az_storage_account_1_acces_tier       = "Hot"
az_storage_account_1_min_tls_version  = "TLS_1_2"



# --- Azure Container variables -------------------------
az_storage_conainer_1_name         = "sc-jenkins-tf"
az_storage_container_1_access_type = "blob"



# --- Azure Virtual Machines variable -------------------------
#az_windows_virtual_machine_1_name         = "VM-Jenkins-TF"
#az_linux_virtual_machine_1_name           = "VM-Jenkins-TF"
az_linux_virtual_machine_1_computer_name  = "Jenkins-TF"
az_virtual_machine_1_size                 = "Standard_B2s"
az_virtual_machine_1_admin_user_name      = "adminuser"
az_virtual_machine_1_admin_user_password  = "AdminPassword-2022"
#az_linux_virtual_machine_1_public_key     = ".ssh/id_rsa.pub"
az_virtual_machine_1_storage_account_type = "StandardSSD_LRS"



# --- AKS -------------------------
aks_version = "1.24.9"

#    Pool name must start with a lowercase letter, have max length of 12, and only have characters a-z0-9
aks_system_node_name = "system"
aks_system_node_count = 1
#aks_system_node_vm_size = "Standard_B2s" # 2 vCPUs + 4GB RAM + 4 Data disks + 1280 IOPS - $34.96/month
aks_system_node_vm_size = "Standard_D2as_v4" # 2 vCPUs + 8GB RAM + 4 Data disks + 3200 IOPS - $81.03/month
#aks_system_node_vm_size =  "Standard_B4ms" # 4 vCPUs + 16GB RAM + 8 Data disks + 2880 IOPS - $137.97/month
aks_system_node_node_type = "VirtualMachineScaleSets"
aks_system_node_labels = { "node-name" : "system", "custom-label-1" : "sys" }

aks_load_balancer_sku = "standard"
aks_network_plugin = "kubenet"
aks_identity_type = "SystemAssigned"



# --- Jenkins -------------------------
jenkins_admin_password = "adminpassword"
