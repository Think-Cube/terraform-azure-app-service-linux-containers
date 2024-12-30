variable "environment" {
  description = "The environment name used for backend container name key (e.g., dev, prod)."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "A mapping of tags to assign to the resource, useful for resource organization and management."
  type        = map(any)
}

variable "region" {
  description = "The Azure region in which the resources are deployed. Example: 'weu' for West Europe."
  type        = string
  default     = "weu"
}

variable "resource_group_location" {
  description = "The location/region where the resource group is created. Changing this forces a new resource to be created."
  default     = "West Europe"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resource."
  type        = string
}

variable "app_service_plan_name" {
  description = "Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
  type        = string
}

variable "app_service_plan_kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption), and FunctionApp (for a Consumption Plan). Defaults to Windows."
  type        = string
  default     = "Linux"
}

variable "app_service_plan_reserved" {
  description = "Indicates whether this App Service Plan is Reserved. Defaults to false."
  type        = bool
  default     = true
}

variable "app_service_plan_tier" {
  description = "Specifies the pricing tier of the App Service Plan. Valid options are Free, Shared, Basic, Standard, PremiumV2, and Isolated."
  type        = string
  default     = "Basic"
}

variable "app_service_plan_size" {
  description = "The size specifier of the resource SKU. Available sizes include F1 (Free), D1 (Shared), B1 (Basic Small), S1 (Standard Small), and many others. See full list for details."
  type        = string
  default     = "S1"
}

variable "app_service_name" {
  description = "The name of the App Service (web application)."
  type        = string
}

variable "app_service_settings" {
  description = "A map of key-value pairs to configure App Settings for the App Service."
  type        = map(any)
  default     = {}
}

variable "app_service_https_only" {
  description = "Indicates whether the App Service should only be accessible via HTTPS. Defaults to false."
  type        = bool
  default     = false
}

variable "app_service_always_on" {
  description = "Indicates whether the App Service should always be running. Defaults to false."
  type        = bool
  default     = false
}

variable "app_service_app_command_line" {
  description = "The command line to launch the app in the App Service. Can be left empty."
  type        = string
  default     = ""
}

variable "app_service_ftps_state" {
  description = "State of FTP / FTPS service for this App Service. Possible values include: AllAllowed, FtpsOnly, and Disabled."
  type        = string
  default     = "FtpsOnly"
}

variable "app_service_http2_enabled" {
  description = "Indicates whether HTTP2 is enabled on this App Service. Defaults to false."
  type        = bool
  default     = false
}

variable "app_service_linux_fx_version" {
  description = "Specifies the Linux App Framework and version for the App Service."
  type        = string
}

variable "app_service_min_tls_version" {
  description = "The minimum supported TLS version for the App Service. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new app services."
  type        = string
  default     = "1.2"
}

variable "app_service_use_32_bit_worker_process" {
  description = "Indicates whether the App Service should run in 32-bit mode rather than 64-bit mode."
  type        = bool
  default     = false
}

variable "app_service_websockets_enabled" {
  description = "Indicates whether WebSockets should be enabled for the App Service."
  type        = bool
  default     = false
}

variable "ip_restrictions" {
  description = "A list of IP addresses allowed to access the App Service."
  type = list(object({
    name    = string
    cidr_ip = string
  }))
  default = []
}

variable "connection_strings" {
  description = "A collection of connection string objects to create with the App Service."
  default     = []
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
}

variable "application_logs_file_system_level" {
  description = "The log level for filesystem-based logging. Supported values are Error, Information, Verbose, Warning, and Off. Defaults to Off."
  default     = "Off"
  type        = string
}

variable "is_blue_green_deployment_enabled" {
  description = "Indicates whether this App Service uses a deployment slot to perform blue-green deployments."
  default     = false
  type        = bool
}

variable "app_settings" {
  description = "A key-value pair of App Settings to configure the App Service."
  default     = {}
}

variable "docker_registry_server_url" {
  description = "The URL that can be used to log into the container registry."
  type        = string
  default     = null
}

variable "docker_registry_server_username" {
  description = "The Username associated with the Container Registry Admin account (if enabled)."
  type        = string
  default     = null
}

variable "docker_registry_server_password" {
  description = "The Password associated with the Container Registry Admin account (if enabled)."
  type        = string
  default     = null
}

variable "app_service_auth_settings" {
  description = "Indicates whether authentication is enabled for the App Service."
  type        = bool
  default     = false
}

variable "identity_settings" {
  description = "A list of identity settings for the App Service."
  type = list(object({
    type = string
    # Add other identity attributes as needed
  }))
  default = []
}

variable "client_cert_enabled" {
  description = "Indicates whether client certificate authentication is enabled for the App Service."
  type        = bool
  default     = false
}

variable "auth_settings" {
  description = "A list of authentication settings for the App Service."
  type = list(object({
    enabled = bool
    # Add other auth_settings attributes as needed
  }))
  default = []
}

variable "default_documents" {
  description = "A list of default documents for the App Service."
  type        = list(string)
  default     = []
}
