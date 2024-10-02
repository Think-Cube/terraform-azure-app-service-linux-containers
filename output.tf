output "id_app_service_plan" {
  description = "The ID of the App Service Plan component."
  value       = azurerm_app_service_plan.main.id
  sensitive   = false
}
output "maximum_number_of_workers" {
  description = "The maximum number of workers supported with the App Service Plan's sku."
  value       = azurerm_app_service_plan.main.maximum_number_of_workers
  sensitive   = false
}
output "id_app_service" {
  description = "The ID of the App Service."
  value       = azurerm_app_service.main.id
  sensitive   = false
}
output "custom_domain_verification_id" {
  description = "An identifier used by App Service to perform domain ownership verification via DNS TXT record."
  value       = azurerm_app_service.main.custom_domain_verification_id
  sensitive   = false
}
output "default_site_hostname_app_service" {
  description = "The Default Hostname associated with the App Service."
  value       = azurerm_app_service.main.default_site_hostname
  sensitive   = false
}
output "outbound_ip_address_list" {
  description = "A list of outbound IP addresses."
  value       = azurerm_app_service.main.outbound_ip_address_list
  sensitive   = false
}
output "id_app_service_slot" {
  description = "The ID of the App Service Slot"
  value       = azurerm_app_service_slot.main.*.id
  sensitive   = false
}
output "default_site_hostname_pp_service_slot" {
  description = "The Default Hostname associated with the App Service Slot."
  value       = azurerm_app_service_slot.main.*.default_site_hostname
  sensitive   = false
}
