# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.1.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/chiragtayal018"
  personal_access_token = var.azure_devops_pat
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}