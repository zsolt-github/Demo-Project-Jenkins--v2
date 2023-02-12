terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Terraform_State"
    storage_account_name = "zfterraformstates"
    container_name       = "tfstates"
    key                  = "demo-project-jenkins.terraform.tfstate"
  }
  #  set the Storage Account Access Key (ARM_ACCESS_KEY) as an environment variable = ARM_ACCESS_KEY="<storage account access key value>"
  #  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.15.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.7.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy       = true
      purge_soft_deleted_keys_on_destroy = true
    }
  }
}

provider "kubernetes" {
  host                   = module.aks.aks_host
  cluster_ca_certificate = base64decode(module.aks.aks_ca_certificate)
  client_certificate     = base64decode(module.aks.aks_client_certificate)
  client_key             = base64decode(module.aks.aks_client_key)
  #host                   = data.azurerm_kubernetes_cluster.data-aks.kube_config.0.host
  #cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.cluster_ca_certificate)
  #client_certificate     = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_certificate)
  #client_key             = base64decode(data.azurerm_kubernetes_cluster.data-aks.kube_config.0.client_key)
}


provider "helm" {
  kubernetes {
  host                   = module.aks.aks_host
  cluster_ca_certificate = base64decode(module.aks.aks_ca_certificate)
  client_certificate     = base64decode(module.aks.aks_client_certificate)
  client_key             = base64decode(module.aks.aks_client_key)
  }
}

provider "random" {}
provider "tls" {}
provider "cloudflare" {}