variable "name" {
  description = "The name of the Linux Web App. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Web App."
  type        = string
}

variable "location" {
  description = "The Azure region where the Linux Web App will be created."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the Service Plan in which to run this Linux Web App."
  type        = string
}

variable "app_settings" {
  description = "A map of key-value pairs of App Settings to assign to the Linux Web App."
  type        = map(string)
  default     = {}
}

variable "client_affinity_enabled" {
  description = "Whether client affinity is enabled for the Linux Web App."
  type        = bool
  default     = null
}

variable "client_certificate_enabled" {
  description = "Whether client certificate authentication is enabled for the Linux Web App."
  type        = bool
  default     = null
}

variable "client_certificate_mode" {
  description = "The Client Certificate mode for the Linux Web App. Possible values are 'Required', 'Optional', and 'OptionalInteractiveUser'."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Whether the Linux Web App is enabled. Defaults to true."
  type        = bool
  default     = true
}

variable "https_only" {
  description = "Whether the Linux Web App should only be accessible via HTTPS. Defaults to false."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Linux Web App. Defaults to true."
  type        = bool
  default     = true
}

variable "virtual_network_subnet_id" {
  description = "The ID of the subnet to place the Linux Web App in for virtual network integration."
  type        = string
  default     = null
}

variable "zip_deploy_file" {
  description = "The local path of a zip package to deploy to the Linux Web App."
  type        = string
  default     = null
}

variable "site_config" {
  description = "Site configuration block for the Linux Web App."
  type = object({
    always_on                                     = optional(bool)
    container_registry_use_managed_identity       = optional(bool)
    container_registry_managed_identity_client_id = optional(string)
    http2_enabled                                 = optional(bool)
    minimum_tls_version                           = optional(string)
    scm_minimum_tls_version                       = optional(string)
    health_check_path                             = optional(string)
    health_check_eviction_time_in_min             = optional(number)
    application_stack = optional(object({
      docker_image_name        = optional(string)
      docker_registry_url      = optional(string)
      docker_registry_username = optional(string)
      docker_registry_password = optional(string)
    }))
    cors = optional(object({
      allowed_origins     = optional(list(string))
      support_credentials = optional(bool)
    }))
    ip_restrictions = optional(list(object({
      ip_address                = optional(string)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      action                    = optional(string)
    })), [])
  })
  default = {}
}

variable "identity" {
  description = "Identity configuration block for the Linux Web App."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "auth_settings_v2" {
  description = "Auth settings v2 configuration block for the Linux Web App."
  type = object({
    auth_enabled           = bool
    runtime_version        = optional(string)
    config_file_path       = optional(string)
    require_authentication = optional(bool)
    unauthenticated_action = optional(string)
    login = optional(object({
      token_store_enabled               = optional(bool)
      token_refresh_extension_time      = optional(number)
      token_store_path                  = optional(string)
      token_store_sas_setting_name      = optional(string)
      preserve_url_fragments_for_logins = optional(bool)
      allowed_external_redirect_urls    = optional(list(string))
      cookie_expiration_convention      = optional(string)
      cookie_expiration_time            = optional(string)
      validate_nonce                    = optional(bool)
      nonce_expiration_time             = optional(string)
      logout_endpoint                   = optional(string)
    }))
  })
  default = null
}

variable "backup" {
  description = "Backup configuration block for the Linux Web App."
  type = object({
    name                = string
    storage_account_url = string
    enabled             = optional(bool)
    schedule = object({
      frequency_interval       = number
      frequency_unit           = string
      keep_at_least_one_backup = optional(bool)
      retention_period_days    = optional(number)
      start_time               = optional(string)
    })
  })
  default = null
}

variable "connection_strings" {
  description = "A list of connection string objects to create with the Linux Web App."
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}

variable "logs" {
  description = "Logs configuration block for the Linux Web App."
  type = object({
    detailed_error_messages = optional(bool)
    failed_request_tracing  = optional(bool)
    application_logs = optional(object({
      file_system_level = string
      azure_blob_storage = optional(object({
        level             = string
        sas_url           = string
        retention_in_days = optional(number)
      }))
    }))
    http_logs = optional(object({
      azure_blob_storage = optional(object({
        sas_url           = string
        retention_in_days = optional(number)
      }))
      file_system = optional(object({
        retention_in_days = number
        retention_in_mb   = number
      }))
    }))
  })
  default = null
}

variable "sticky_settings" {
  description = "Sticky settings configuration block for the Linux Web App."
  type = object({
    app_setting_names       = optional(list(string))
    connection_string_names = optional(list(string))
  })
  default = null
}

variable "storage_accounts" {
  description = "A list of storage account mounts for the Linux Web App."
  type = list(object({
    access_key   = string
    account_name = string
    name         = string
    share_name   = string
    type         = string
    mount_path   = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Tags to assign to resources."
  type        = map(string)
  default     = {}
}
