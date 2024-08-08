terraform {
  backend "azurerm" {
    resource_group_name  = "react-resources"
    storage_account_name = "tfstorefile"                   
    container_name       = "tfstate"                      
    key                  = "prod.terraform.tfstate"        
  }
}
