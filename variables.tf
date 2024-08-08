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
  default     = "ykafw7pkmqhly63v26opvgz5uds3akoanfdkdgvevs6t7wvykf6q"

}
variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default = "625c37b3-4f97-45bb-b1a4-c080858632ab"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default = "17bd46f2-ce41-4bdf-b47b-2347dc85340d"
}

variable "subscription_name" {
  description = "Azure Subscription Name"
  type        = string
  default     = "Azure for Students"
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
  default = "4afb82c8-b1b7-4acb-95b8-7e45627e4539"
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  default = "v9J8Q~LZnU5qTxHnLlFQeL0gRRU3GuIvxBzn9c_A"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default = "react"
}
