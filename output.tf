output "resource_group_name" {
  value = module.base_infra.resource_group_name
}

#output "aks_namespace-jenkins_id" {
#  value = module.aks.aks_namespace-jenkins_id
#  sensitive = true
#}

#output "output-public_ip_1_address" {
  #value = data.azurerm_public_ip.data-public_ip_1.ip_address
#  value = module.jenkins_vm.output-public_ip_1_address
#}

#output "output-net_int_1_mac-address" {
#  value = module.jenkins_vm.output-net_int_1_mac-address
#}

#output "output-cloudflare_hostname" {
#  value = module.jenkins_vm.output-cloudflare_hostname
#}
