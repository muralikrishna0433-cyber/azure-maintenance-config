variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
  default = "rg-maintenance"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "maintenance_name" {
  type = string
  default = "my-maintenance-config"
}
