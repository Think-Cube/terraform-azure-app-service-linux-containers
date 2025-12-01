## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.54.0/docs/resources/app_service) | resource |
| [azurerm_app_service_plan.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.54.0/docs/resources/app_service_plan) | resource |
| [azurerm_app_service_slot.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.54.0/docs/resources/app_service_slot) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.54.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.54.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_always_on"></a> [app\_service\_always\_on](#input\_app\_service\_always\_on) | Indicates whether the App Service should always be running. Defaults to false. | `bool` | `false` | no |
| <a name="input_app_service_app_command_line"></a> [app\_service\_app\_command\_line](#input\_app\_service\_app\_command\_line) | The command line to launch the app in the App Service. Can be left empty. | `string` | `""` | no |
| <a name="input_app_service_auth_settings"></a> [app\_service\_auth\_settings](#input\_app\_service\_auth\_settings) | Indicates whether authentication is enabled for the App Service. | `bool` | `false` | no |
| <a name="input_app_service_ftps_state"></a> [app\_service\_ftps\_state](#input\_app\_service\_ftps\_state) | State of FTP / FTPS service for this App Service. Possible values include: AllAllowed, FtpsOnly, and Disabled. | `string` | `"FtpsOnly"` | no |
| <a name="input_app_service_http2_enabled"></a> [app\_service\_http2\_enabled](#input\_app\_service\_http2\_enabled) | Indicates whether HTTP2 is enabled on this App Service. Defaults to false. | `bool` | `false` | no |
| <a name="input_app_service_https_only"></a> [app\_service\_https\_only](#input\_app\_service\_https\_only) | Indicates whether the App Service should only be accessible via HTTPS. Defaults to false. | `bool` | `false` | no |
| <a name="input_app_service_linux_fx_version"></a> [app\_service\_linux\_fx\_version](#input\_app\_service\_linux\_fx\_version) | Specifies the Linux App Framework and version for the App Service. | `string` | n/a | yes |
| <a name="input_app_service_min_tls_version"></a> [app\_service\_min\_tls\_version](#input\_app\_service\_min\_tls\_version) | The minimum supported TLS version for the App Service. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new app services. | `string` | `"1.2"` | no |
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | The name of the App Service (web application). | `string` | n/a | yes |
| <a name="input_app_service_plan_kind"></a> [app\_service\_plan\_kind](#input\_app\_service\_plan\_kind) | The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption), and FunctionApp (for a Consumption Plan). Defaults to Windows. | `string` | `"Linux"` | no |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Specifies the name of the App Service Plan component. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_app_service_plan_reserved"></a> [app\_service\_plan\_reserved](#input\_app\_service\_plan\_reserved) | Indicates whether this App Service Plan is Reserved. Defaults to false. | `bool` | `true` | no |
| <a name="input_app_service_plan_size"></a> [app\_service\_plan\_size](#input\_app\_service\_plan\_size) | The size specifier of the resource SKU. Available sizes include F1 (Free), D1 (Shared), B1 (Basic Small), S1 (Standard Small), and many others. See full list for details. | `string` | `"S1"` | no |
| <a name="input_app_service_plan_tier"></a> [app\_service\_plan\_tier](#input\_app\_service\_plan\_tier) | Specifies the pricing tier of the App Service Plan. Valid options are Free, Shared, Basic, Standard, PremiumV2, and Isolated. | `string` | `"Basic"` | no |
| <a name="input_app_service_settings"></a> [app\_service\_settings](#input\_app\_service\_settings) | A map of key-value pairs to configure App Settings for the App Service. | `map(any)` | `{}` | no |
| <a name="input_app_service_use_32_bit_worker_process"></a> [app\_service\_use\_32\_bit\_worker\_process](#input\_app\_service\_use\_32\_bit\_worker\_process) | Indicates whether the App Service should run in 32-bit mode rather than 64-bit mode. | `bool` | `false` | no |
| <a name="input_app_service_websockets_enabled"></a> [app\_service\_websockets\_enabled](#input\_app\_service\_websockets\_enabled) | Indicates whether WebSockets should be enabled for the App Service. | `bool` | `false` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A key-value pair of App Settings to configure the App Service. | `map` | `{}` | no |
| <a name="input_application_logs_file_system_level"></a> [application\_logs\_file\_system\_level](#input\_application\_logs\_file\_system\_level) | The log level for filesystem-based logging. Supported values are Error, Information, Verbose, Warning, and Off. Defaults to Off. | `string` | `"Off"` | no |
| <a name="input_auth_settings"></a> [auth\_settings](#input\_auth\_settings) | A list of authentication settings for the App Service. | <pre>list(object({<br/>    enabled = bool<br/>    # Add other auth_settings attributes as needed<br/>  }))</pre> | `[]` | no |
| <a name="input_client_cert_enabled"></a> [client\_cert\_enabled](#input\_client\_cert\_enabled) | Indicates whether client certificate authentication is enabled for the App Service. | `bool` | `false` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | A collection of connection string objects to create with the App Service. | <pre>list(object({<br/>    name  = string<br/>    type  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_default_documents"></a> [default\_documents](#input\_default\_documents) | A list of default documents for the App Service. | `list(string)` | `[]` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource, useful for resource organization and management. | `map(any)` | n/a | yes |
| <a name="input_docker_registry_server_password"></a> [docker\_registry\_server\_password](#input\_docker\_registry\_server\_password) | The Password associated with the Container Registry Admin account (if enabled). | `string` | `null` | no |
| <a name="input_docker_registry_server_url"></a> [docker\_registry\_server\_url](#input\_docker\_registry\_server\_url) | The URL that can be used to log into the container registry. | `string` | `null` | no |
| <a name="input_docker_registry_server_username"></a> [docker\_registry\_server\_username](#input\_docker\_registry\_server\_username) | The Username associated with the Container Registry Admin account (if enabled). | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name used for backend container name key (e.g., dev, prod). | `string` | `"dev"` | no |
| <a name="input_identity_settings"></a> [identity\_settings](#input\_identity\_settings) | A list of identity settings for the App Service. | <pre>list(object({<br/>    type = string<br/>    # Add other identity attributes as needed<br/>  }))</pre> | `[]` | no |
| <a name="input_ip_restrictions"></a> [ip\_restrictions](#input\_ip\_restrictions) | A list of IP addresses allowed to access the App Service. | <pre>list(object({<br/>    name    = string<br/>    cidr_ip = string<br/>  }))</pre> | `[]` | no |
| <a name="input_is_blue_green_deployment_enabled"></a> [is\_blue\_green\_deployment\_enabled](#input\_is\_blue\_green\_deployment\_enabled) | Indicates whether this App Service uses a deployment slot to perform blue-green deployments. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The Azure region in which the resources are deployed. Example: 'weu' for West Europe. | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the resource group is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the resource. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_domain_verification_id"></a> [custom\_domain\_verification\_id](#output\_custom\_domain\_verification\_id) | An identifier used by App Service to verify domain ownership via a DNS TXT record for custom domain configuration. |
| <a name="output_default_site_hostname_app_service"></a> [default\_site\_hostname\_app\_service](#output\_default\_site\_hostname\_app\_service) | The default hostname associated with the App Service, used for accessing the web application. |
| <a name="output_default_site_hostname_pp_service_slot"></a> [default\_site\_hostname\_pp\_service\_slot](#output\_default\_site\_hostname\_pp\_service\_slot) | The default hostname associated with the App Service Slot, used to access the application in that slot. |
| <a name="output_id_app_service"></a> [id\_app\_service](#output\_id\_app\_service) | The unique ID of the App Service, which represents the deployed web application. |
| <a name="output_id_app_service_plan"></a> [id\_app\_service\_plan](#output\_id\_app\_service\_plan) | The unique ID of the App Service Plan component, which defines the pricing and scaling properties of the App Service. |
| <a name="output_id_app_service_slot"></a> [id\_app\_service\_slot](#output\_id\_app\_service\_slot) | The unique ID of the App Service Slot, representing a specific deployment environment (e.g., staging or production). |
| <a name="output_maximum_number_of_workers"></a> [maximum\_number\_of\_workers](#output\_maximum\_number\_of\_workers) | The maximum number of workers supported by the App Service Plan's SKU, determining the scaling capacity. |
| <a name="output_outbound_ip_address_list"></a> [outbound\_ip\_address\_list](#output\_outbound\_ip\_address\_list) | A list of outbound IP addresses used by the App Service for outgoing traffic. |
