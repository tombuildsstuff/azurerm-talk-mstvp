data "azurerm_resource_group" "main" {
  name = "${var.resource_group_name}"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["${var.network_address_space}"]
  location            = "${data.azurerm_resource_group.main.location}"
  resource_group_name = "${data.azurerm_resource_group.main.name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "${data.azurerm_resource_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "${cidrsubnet(var.network_address_space, 8, 2)}"
}

variable "network_address_space" {
  default = "10.0.0.0/16"
}
