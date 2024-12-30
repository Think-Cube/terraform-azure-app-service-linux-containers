output "id_app_service_plan" {
  description = "The unique ID of the App Service Plan component, which defines the pricing and scaling properties of the App Service."
  value       = azurerm_app_service_plan.main.id
  sensitive   = false
}

output "maximum_number_of_workers" {
  description = "The maximum number of workers supported by the App Service Plan's SKU, determining the scaling capacity."
  value       = azurerm_app_service_plan.main.maximum_number_of_workers
  sensitive   = false
}

output "id_app_service" {
  description = "The unique ID of the App Service, which represents the deployed web application."
  value       = azurerm_app_service.main.id
  sensitive   = false
}

output "custom_domain_verification_id" {
  description = "An identifier used by App Service to verify domain ownership via a DNS TXT record for custom domain configuration."
  value       = azurerm_app_service.main.custom_domain_verification_id
  sensitive   = false
}

output "default_site_hostname_app_service" {
  description = "The default hostname associated with the App Service, used for accessing the web application."
  value       = azurerm_app_service.main.default_site_hostname
  sensitive   = false
}

output "outbound_ip_address_list" {
  description = "A list of outbound IP addresses used by the App Service for outgoing traffic."
  value       = azurerm_app_service.main.outbound_ip_address_list
  sensitive   = false
}

output "id_app_service_slot" {
  description = "The unique ID of the App Service Slot, representing a specific deployment environment (e.g., staging or production)."
  value       = azurerm_app_service_slot.main.*.id
  sensitive   = false
}

output "default_site_hostname_pp_service_slot" {
  description = "The default hostname associated with the App Service Slot, used to access the application in that slot."
  value       = azurerm_app_service_slot.main.*.default_site_hostname
  sensitive   = false
}
