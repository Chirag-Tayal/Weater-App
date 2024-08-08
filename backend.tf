terraform {
  backend "azurerm" {
    resource_group_name  = "react-resources"
    storage_account_name = "tfstoreacc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}