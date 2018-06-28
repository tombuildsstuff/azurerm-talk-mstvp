data "azurerm_resource_group" "main" {
  name = "${var.resource_group_name}"
}

data "azurerm_subnet" "main" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.network_name}"
  resource_group_name  = "${var.network_resource_group_name}"
}
