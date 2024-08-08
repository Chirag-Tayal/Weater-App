terraform {
  backend "azurerm" {
    resource_group_name   = "react-resources"
    storage_account_name  = "tfstorecontainer"
    container_name        = "tfstatefiles"
    key                   = "prod.terraform.tfstate"
    
  }
}