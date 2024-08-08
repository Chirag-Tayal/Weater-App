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
