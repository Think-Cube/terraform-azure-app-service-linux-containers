# Terraform Module — Azure App Service Linux Containers

Provisions an `azurerm_linux_web_app` configured for container workloads, including site_config with application_stack, CORS, IP restrictions, identity, backup, and connection strings.

## Usage

```hcl
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
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_web_app.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of key-value pairs of App Settings to assign to the Linux Web App. | `map(string)` | `{}` | no |
| <a name="input_auth_settings_v2"></a> [auth\_settings\_v2](#input\_auth\_settings\_v2) | Auth settings v2 configuration block for the Linux Web App. | <pre>object({<br>    auth_enabled           = bool<br>    runtime_version        = optional(string)<br>    config_file_path       = optional(string)<br>    require_authentication = optional(bool)<br>    unauthenticated_action = optional(string)<br>    login = optional(object({<br>      token_store_enabled               = optional(bool)<br>      token_refresh_extension_time      = optional(number)<br>      token_store_path                  = optional(string)<br>      token_store_sas_setting_name      = optional(string)<br>      preserve_url_fragments_for_logins = optional(bool)<br>      allowed_external_redirect_urls    = optional(list(string))<br>      cookie_expiration_convention      = optional(string)<br>      cookie_expiration_time            = optional(string)<br>      validate_nonce                    = optional(bool)<br>      nonce_expiration_time             = optional(string)<br>      logout_endpoint                   = optional(string)<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_backup"></a> [backup](#input\_backup) | Backup configuration block for the Linux Web App. | <pre>object({<br>    name                = string<br>    storage_account_url = string<br>    enabled             = optional(bool)<br>    schedule = object({<br>      frequency_interval       = number<br>      frequency_unit           = string<br>      keep_at_least_one_backup = optional(bool)<br>      retention_period_days    = optional(number)<br>      start_time               = optional(string)<br>    })<br>  })</pre> | `null` | no |
| <a name="input_client_affinity_enabled"></a> [client\_affinity\_enabled](#input\_client\_affinity\_enabled) | Whether client affinity is enabled for the Linux Web App. | `bool` | `null` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | Whether client certificate authentication is enabled for the Linux Web App. | `bool` | `null` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | The Client Certificate mode for the Linux Web App. Possible values are 'Required', 'Optional', and 'OptionalInteractiveUser'. | `string` | `null` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | A list of connection string objects to create with the Linux Web App. | <pre>list(object({<br>    name  = string<br>    type  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the Linux Web App is enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Whether the Linux Web App should only be accessible via HTTPS. Defaults to false. | `bool` | `false` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | Identity configuration block for the Linux Web App. | <pre>object({<br>    type         = string<br>    identity_ids = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Linux Web App will be created. | `string` | n/a | yes |
| <a name="input_logs"></a> [logs](#input\_logs) | Logs configuration block for the Linux Web App. | <pre>object({<br>    detailed_error_messages = optional(bool)<br>    failed_request_tracing  = optional(bool)<br>    application_logs = optional(object({<br>      file_system_level = string<br>      azure_blob_storage = optional(object({<br>        level             = string<br>        sas_url           = string<br>        retention_in_days = optional(number)<br>      }))<br>    }))<br>    http_logs = optional(object({<br>      azure_blob_storage = optional(object({<br>        sas_url           = string<br>        retention_in_days = optional(number)<br>      }))<br>      file_system = optional(object({<br>        retention_in_days = number<br>        retention_in_mb   = number<br>      }))<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Linux Web App. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is enabled for the Linux Web App. Defaults to true. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Linux Web App. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The ID of the Service Plan in which to run this Linux Web App. | `string` | n/a | yes |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | Site configuration block for the Linux Web App. | <pre>object({<br>    always_on                                     = optional(bool)<br>    container_registry_use_managed_identity       = optional(bool)<br>    container_registry_managed_identity_client_id = optional(string)<br>    http2_enabled                                 = optional(bool)<br>    minimum_tls_version                           = optional(string)<br>    scm_minimum_tls_version                       = optional(string)<br>    health_check_path                             = optional(string)<br>    health_check_eviction_time_in_min             = optional(number)<br>    application_stack = optional(object({<br>      docker_image_name        = optional(string)<br>      docker_registry_url      = optional(string)<br>      docker_registry_username = optional(string)<br>      docker_registry_password = optional(string)<br>    }))<br>    cors = optional(object({<br>      allowed_origins     = optional(list(string))<br>      support_credentials = optional(bool)<br>    }))<br>    ip_restrictions = optional(list(object({<br>      ip_address                = optional(string)<br>      service_tag               = optional(string)<br>      virtual_network_subnet_id = optional(string)<br>      name                      = optional(string)<br>      priority                  = optional(number)<br>      action                    = optional(string)<br>    })), [])<br>  })</pre> | `{}` | no |
| <a name="input_sticky_settings"></a> [sticky\_settings](#input\_sticky\_settings) | Sticky settings configuration block for the Linux Web App. | <pre>object({<br>    app_setting_names       = optional(list(string))<br>    connection_string_names = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | A list of storage account mounts for the Linux Web App. | <pre>list(object({<br>    access_key   = string<br>    account_name = string<br>    name         = string<br>    share_name   = string<br>    type         = string<br>    mount_path   = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | The ID of the subnet to place the Linux Web App in for virtual network integration. | `string` | `null` | no |
| <a name="input_zip_deploy_file"></a> [zip\_deploy\_file](#input\_zip\_deploy\_file) | The local path of a zip package to deploy to the Linux Web App. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_domain_verification_id"></a> [custom\_domain\_verification\_id](#output\_custom\_domain\_verification\_id) | An identifier used by App Service to verify domain ownership via a DNS TXT record. |
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname associated with the Linux Web App. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier for the Linux Web App. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity block containing the managed identity details associated with the Linux Web App. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Linux Web App. |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma-separated list of outbound IP addresses for the Linux Web App. |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | A comma-separated list of possible outbound IP addresses for the Linux Web App. |
<!-- END_TF_DOCS -->