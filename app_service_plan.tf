resource "azurerm_app_service_plan" "main" {
  name                = "${var.environment}-${var.app_service_plan_name}${var.region}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  kind                = var.app_service_plan_kind
  reserved            = var.app_service_plan_reserved
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
  tags = var.default_tags
}
