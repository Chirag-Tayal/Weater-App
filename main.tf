resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_app_service_plan" "example" {
  name                = "${var.prefix}-app-service-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "${var.app}stat"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "NODE|20-lts"
  }

  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = "20.0.0"
  }

  https_only = true
}

output "app_service_name" {
  value = azurerm_app_service.example.name
}

output "azure_service_connection" {
  value = azuredevops_serviceendpoint_azurerm.example.id
}


resource "azuredevops_serviceendpoint_azurerm" "example" {
  project_id            = "28f5b3ba-c89d-445b-b328-03ecb3fbba5b"
  service_endpoint_name = "${var.prefix}-service-connection"
  description           = "Service connection for ${var.prefix}"

  # Authentication details
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name

  credentials {
    serviceprincipalid  = var.client_id
    serviceprincipalkey = var.client_secret
  }
}

