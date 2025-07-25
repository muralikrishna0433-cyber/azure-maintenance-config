provider "azurerm" {
    subscription_id = var.subscription_id

  features  {} #
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_maintenance_configuration" "maintenance" {
  name                = var.maintenance_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  scope               = "InGuestPatch"

  window {
    start_date_time       = "2025-08-01T02:00:00Z"
    expiration_date_time  = "2025-12-01T02:00:00Z"
    duration              = "02:00"
    time_zone             = "Pacific Standard Time"
    recur_every           = "Week Saturday"
  }
  install_patches {
  reboot_setting = "IfRequired"
  classifications_to_include = ["Critical", "Security"]
  kb_numbers_to_exclude = []
}
}
