# Example: Advanced

Full-featured example for `terraform-azure-app-service-linux-containers`.

```hcl
module "linux_web_app" {
  source = "github.com/Think-Cube/terraform-azure-app-service-linux-containers?ref=v1.0.0"

  name                          = "webapp-prod-example"
  resource_group_name           = "rg-example"
  location                      = "West Europe"
  service_plan_id               = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Web/serverFarms/asp-example"
  https_only                    = true
  public_network_access_enabled = false
  client_certificate_enabled    = true
  client_certificate_mode       = "Required"

  app_settings = {
    DOCKER_REGISTRY_SERVER_URL      = "https://myregistry.azurecr.io"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }

  site_config = {
    always_on             = true
    http2_enabled         = true
    minimum_tls_version   = "1.2"
    health_check_path     = "/health"
    container_registry_use_managed_identity = true
    application_stack = {
      docker_image_name   = "myregistry.azurecr.io/myapp:latest"
      docker_registry_url = "https://myregistry.azurecr.io"
    }
    cors = {
      allowed_origins     = ["https://example.com"]
      support_credentials = false
    }
  }

  identity = {
    type = "SystemAssigned"
  }

  sticky_settings = {
    app_setting_names = ["DOCKER_REGISTRY_SERVER_URL"]
  }

  logs = {
    detailed_error_messages = true
    failed_request_tracing  = false
    http_logs = {
      file_system = {
        retention_in_days = 7
        retention_in_mb   = 35
      }
    }
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}```` 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_linux_web_app"></a> [linux\_web\_app](#module\_linux\_web\_app) | github.com/Think-Cube/terraform-azure-app-service-linux-containers | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->