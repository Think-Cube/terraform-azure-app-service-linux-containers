output "id" {
  description = "The unique identifier for the Linux Web App."
  value       = azurerm_linux_web_app.main.id
}

output "name" {
  description = "The name of the Linux Web App."
  value       = azurerm_linux_web_app.main.name
}

output "default_hostname" {
  description = "The default hostname associated with the Linux Web App."
  value       = azurerm_linux_web_app.main.default_hostname
}

output "identity" {
  description = "The identity block containing the managed identity details associated with the Linux Web App."
  value       = try(azurerm_linux_web_app.main.identity, null)
}

output "outbound_ip_addresses" {
  description = "A comma-separated list of outbound IP addresses for the Linux Web App."
  value       = azurerm_linux_web_app.main.outbound_ip_addresses
}

output "possible_outbound_ip_addresses" {
  description = "A comma-separated list of possible outbound IP addresses for the Linux Web App."
  value       = azurerm_linux_web_app.main.possible_outbound_ip_addresses
}

output "custom_domain_verification_id" {
  description = "An identifier used by App Service to verify domain ownership via a DNS TXT record."
  value       = azurerm_linux_web_app.main.custom_domain_verification_id
  sensitive   = true
}
