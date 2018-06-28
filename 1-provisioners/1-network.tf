resource "azurerm_resource_group" "network" {
  name     = "${local.prefix}nw-resources"
  location = "${local.location}"
}

module "network" {
  source              = "../modules/network"
  prefix              = "${local.prefix}"
  resource_group_name = "${azurerm_resource_group.network.name}"
  location            = "${local.location}"
}
