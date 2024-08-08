variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "East US"
}

variable "app" {
  description = "Name of the app"
  type        = string
  default     = "accuweather"
}

variable "azure_devops_pat" {
  description = "Azure DevOps Personal Access Token"
  type        = string
  default     = "pov5xrx47lehqf7vh2j5t42ovmdlu64xpk4t56tenxgxuhoz5o7q"

}
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "subscription_name" {
  description = "Azure Subscription Name"
  type        = string
  default     = "Azure for Students"
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}
