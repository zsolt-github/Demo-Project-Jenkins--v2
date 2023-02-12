variable "az_tag_environment" {
    type        = string
    description = "The environment tag."
}

variable "az_tag_project" {
    #type        = string
    description = "The project tag."
    default     = "Storage"
}


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


# --- Variables for the Azure Virtual Network -------------------------

variable "az_virtual_network_name" {
    type        = string
    description = "Name of the VLAN in Azure."
}

variable "az_virtual_network_address_space" {
    type        = string
    description = "The address space of the VLAN in Azure."
}


# --- Variables for Azure the Subnet -------------------------

variable "az_subnet_1_name" {
    type        = string
    description = "Name of Subnet 1 in Azure."
}

variable "az_subnet_1_address_prefix" {
    type        = string
    description = "The address space of Subnet 1 in Azure."
}

#variable "az_subnets" {
#    type = map(any)
#    description = "List of Subnets and address spaces in Azure."
#    default = {
#      "SN-Web" = "10.30.11.0/24"
#      "SN-App" = "10.30.12.0/24"
#      "SN-DB" = "10.30.13.0/24"
#    }
#}


