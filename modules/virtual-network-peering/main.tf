data "azurerm_virtual_network" "primary" {
  name                = "${var.primary_network_name}"
  resource_group_name = "${var.primary_resource_group_name}"
}

data "azurerm_virtual_network" "secondary" {
  name                = "${var.secondary_network_name}"
  resource_group_name = "${var.secondary_resource_group_name}"
}

resource "azurerm_virtual_network_peering" "primary-to-secondary" {
  name                      = "primary-to-secondary"
  resource_group_name       = "${var.primary_resource_group_name}"
  virtual_network_name      = "${var.primary_network_name}"
  remote_virtual_network_id = "${data.azurerm_virtual_network.secondary.id}"
}

resource "azurerm_virtual_network_peering" "secondary-to-primary" {
  name                      = "secondary-to-primary"
  resource_group_name       = "${var.secondary_resource_group_name}"
  virtual_network_name      = "${var.secondary_network_name}"
  remote_virtual_network_id = "${data.azurerm_virtual_network.primary.id}"
}

variable "primary_network_name" {}
variable "primary_resource_group_name" {}
variable "secondary_network_name" {}
variable "secondary_resource_group_name" {}
