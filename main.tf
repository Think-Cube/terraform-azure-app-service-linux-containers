resource "azurerm_linux_web_app" "main" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  service_plan_id                 = var.service_plan_id
  app_settings                    = var.app_settings
  client_affinity_enabled         = var.client_affinity_enabled
  client_certificate_enabled      = var.client_certificate_enabled
  client_certificate_mode         = var.client_certificate_mode
  enabled                         = var.enabled
  https_only                      = var.https_only
  public_network_access_enabled   = var.public_network_access_enabled
  virtual_network_subnet_id       = var.virtual_network_subnet_id
  zip_deploy_file                 = var.zip_deploy_file
  tags                            = var.tags

  site_config {
    always_on                                     = var.site_config.always_on
    container_registry_use_managed_identity       = var.site_config.container_registry_use_managed_identity
    container_registry_managed_identity_client_id = var.site_config.container_registry_managed_identity_client_id
    http2_enabled                                 = var.site_config.http2_enabled
    minimum_tls_version                           = var.site_config.minimum_tls_version
    scm_minimum_tls_version                       = var.site_config.scm_minimum_tls_version
    health_check_path                             = var.site_config.health_check_path
    health_check_eviction_time_in_min             = var.site_config.health_check_eviction_time_in_min

    dynamic "application_stack" {
      for_each = var.site_config.application_stack != null ? [var.site_config.application_stack] : []
      content {
        docker_image_name        = application_stack.value.docker_image_name
        docker_registry_url      = application_stack.value.docker_registry_url
        docker_registry_username = application_stack.value.docker_registry_username
        docker_registry_password = application_stack.value.docker_registry_password
      }
    }

    dynamic "cors" {
      for_each = var.site_config.cors != null ? [var.site_config.cors] : []
      content {
        allowed_origins     = cors.value.allowed_origins
        support_credentials = cors.value.support_credentials
      }
    }

    dynamic "ip_restriction" {
      for_each = var.site_config.ip_restrictions
      content {
        ip_address                = try(ip_restriction.value.ip_address, null)
        service_tag               = try(ip_restriction.value.service_tag, null)
        virtual_network_subnet_id = try(ip_restriction.value.virtual_network_subnet_id, null)
        name                      = try(ip_restriction.value.name, null)
        priority                  = try(ip_restriction.value.priority, null)
        action                    = try(ip_restriction.value.action, "Allow")
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  dynamic "auth_settings_v2" {
    for_each = var.auth_settings_v2 != null ? [var.auth_settings_v2] : []
    content {
      auth_enabled           = auth_settings_v2.value.auth_enabled
      runtime_version        = try(auth_settings_v2.value.runtime_version, null)
      config_file_path       = try(auth_settings_v2.value.config_file_path, null)
      require_authentication = try(auth_settings_v2.value.require_authentication, null)
      unauthenticated_action = try(auth_settings_v2.value.unauthenticated_action, null)

      dynamic "login" {
        for_each = try(auth_settings_v2.value.login, null) != null ? [auth_settings_v2.value.login] : []
        content {
          token_store_enabled               = try(login.value.token_store_enabled, null)
          token_refresh_extension_time      = try(login.value.token_refresh_extension_time, null)
          token_store_path                  = try(login.value.token_store_path, null)
          token_store_sas_setting_name      = try(login.value.token_store_sas_setting_name, null)
          preserve_url_fragments_for_logins = try(login.value.preserve_url_fragments_for_logins, null)
          allowed_external_redirect_urls    = try(login.value.allowed_external_redirect_urls, null)
          cookie_expiration_convention      = try(login.value.cookie_expiration_convention, null)
          cookie_expiration_time            = try(login.value.cookie_expiration_time, null)
          validate_nonce                    = try(login.value.validate_nonce, null)
          nonce_expiration_time             = try(login.value.nonce_expiration_time, null)
          logout_endpoint                   = try(login.value.logout_endpoint, null)
        }
      }
    }
  }

  dynamic "backup" {
    for_each = var.backup != null ? [var.backup] : []
    content {
      name                = backup.value.name
      storage_account_url = backup.value.storage_account_url
      enabled             = try(backup.value.enabled, true)

      schedule {
        frequency_interval       = backup.value.schedule.frequency_interval
        frequency_unit           = backup.value.schedule.frequency_unit
        keep_at_least_one_backup = try(backup.value.schedule.keep_at_least_one_backup, null)
        retention_period_days    = try(backup.value.schedule.retention_period_days, null)
        start_time               = try(backup.value.schedule.start_time, null)
      }
    }
  }

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  dynamic "logs" {
    for_each = var.logs != null ? [var.logs] : []
    content {
      detailed_error_messages = try(logs.value.detailed_error_messages, null)
      failed_request_tracing  = try(logs.value.failed_request_tracing, null)

      dynamic "application_logs" {
        for_each = try(logs.value.application_logs, null) != null ? [logs.value.application_logs] : []
        content {
          file_system_level = application_logs.value.file_system_level

          dynamic "azure_blob_storage" {
            for_each = try(application_logs.value.azure_blob_storage, null) != null ? [application_logs.value.azure_blob_storage] : []
            content {
              level             = azure_blob_storage.value.level
              sas_url           = azure_blob_storage.value.sas_url
              retention_in_days = try(azure_blob_storage.value.retention_in_days, null)
            }
          }
        }
      }

      dynamic "http_logs" {
        for_each = try(logs.value.http_logs, null) != null ? [logs.value.http_logs] : []
        content {
          dynamic "azure_blob_storage" {
            for_each = try(http_logs.value.azure_blob_storage, null) != null ? [http_logs.value.azure_blob_storage] : []
            content {
              sas_url           = azure_blob_storage.value.sas_url
              retention_in_days = try(azure_blob_storage.value.retention_in_days, null)
            }
          }
          dynamic "file_system" {
            for_each = try(http_logs.value.file_system, null) != null ? [http_logs.value.file_system] : []
            content {
              retention_in_days = file_system.value.retention_in_days
              retention_in_mb   = file_system.value.retention_in_mb
            }
          }
        }
      }
    }
  }

  dynamic "sticky_settings" {
    for_each = var.sticky_settings != null ? [var.sticky_settings] : []
    content {
      app_setting_names       = try(sticky_settings.value.app_setting_names, null)
      connection_string_names = try(sticky_settings.value.connection_string_names, null)
    }
  }

  dynamic "storage_account" {
    for_each = var.storage_accounts
    content {
      access_key   = storage_account.value.access_key
      account_name = storage_account.value.account_name
      name         = storage_account.value.name
      share_name   = storage_account.value.share_name
      type         = storage_account.value.type
      mount_path   = try(storage_account.value.mount_path, null)
    }
  }
}
