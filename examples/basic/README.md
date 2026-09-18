# Example: Basic

Minimal working example for `terraform-azure-app-service-linux-containers`.

```hcl
module "linux_web_app" {
  source = "github.com/Think-Cube/terraform-azure-app-service-linux-containers?ref=v1.0.0"

  name                = "webapp-dev-example"
  resource_group_name = "rg-example"
  location            = "West Europe"
  service_plan_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Web/serverFarms/asp-example"

  https_only = true

  site_config = {
    always_on     = true
    http2_enabled = true
    application_stack = {
      docker_image_name   = "nginx:latest"
      docker_registry_url = "https://index.docker.io"
    }
  }

  tags = {
    environment = "dev"
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