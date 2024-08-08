# Existing Azure RM resources
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



provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/chiragtayal018"
  personal_access_token = var.azure_devops_pat
}

resource "azuredevops_serviceendpoint_azurerm" "example" {
  project_id            = "28f5b3ba-c89d-445b-b328-03ecb3fbba5b" # Use your existing project ID
  service_endpoint_name = "tf-service-connection"

  credentials {
    serviceprincipalid  = var.azure_service_principal_id
    serviceprincipalkey = var.azure_service_principal_key
  }

  azurerm_spn_tenantid      = var.azure_tenant_id
  azurerm_subscription_id   = var.azure_subscription_id
  azurerm_subscription_name = "example-subscription"
}

