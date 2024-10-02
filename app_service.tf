#tfsec:ignore:azure-appservice-require-client-cert #tfsec:ignore:azure-appservice-account-identity-registered
resource "azurerm_app_service" "main" {
  name                = "${var.environment}-${var.app_service_name}-${var.region}-app"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.main.id
  app_settings        = var.app_service_settings
  https_only          = var.app_service_https_only
  auth_settings {
    #tfsec:ignore:azure-appservice-authentication-enabled
    enabled = var.app_service_auth_settings
  }
  site_config {
    always_on        = var.app_service_always_on
    app_command_line = var.app_service_app_command_line
    ftps_state       = var.app_service_ftps_state
    #tfsec:ignore:azure-appservice-enable-http2
    http2_enabled             = var.app_service_http2_enabled
    linux_fx_version          = var.app_service_linux_fx_version
    min_tls_version           = var.app_service_min_tls_version
    use_32_bit_worker_process = var.app_service_use_32_bit_worker_process
    websockets_enabled        = var.app_service_websockets_enabled
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        ip_address = ip_restriction.value["cidr_ip"]
        name       = ip_restriction.value["name"]
        action     = "Allow"
        priority   = ip_restriction.key + 1
      }
    }
  }
  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value["name"]
      type  = connection_string.value["type"]
      value = connection_string.value["value"]
    }
  }
  logs {
    application_logs {
      file_system_level = var.application_logs_file_system_level
    }
  }
  lifecycle {
    ignore_changes = [
      site_config.0.linux_fx_version
    ]
  }
}

