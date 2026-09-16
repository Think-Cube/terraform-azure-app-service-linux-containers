module "app_service" {
  source = "github.com/Think-Cube/terraform-azure-app-service-linux-containers?ref=v1.0.0"

  name                = "myapp-linux"
  resource_group_name = "my-rg"
  location            = "West Europe"
  service_plan_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Web/serverfarms/my-plan"

  https_only = true

  site_config = {
    always_on      = true
    http2_enabled  = true
    application_stack = {
      docker_image_name        = "nginx:latest"
      docker_registry_url      = "https://index.docker.io"
    }
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}