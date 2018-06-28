locals {
  prefix = "tom2mod"
}

resource "azurerm_resource_group" "uk" {
  name     = "${local.prefix}-uk"
  location = "UK South"
}

module "uk-network" {
  source              = "../../modules/network"
  prefix              = "${local.prefix}-uk"
  resource_group_name = "${azurerm_resource_group.uk.name}"
  location            = "${azurerm_resource_group.uk.location}"
}

resource "azurerm_resource_group" "usa" {
  name     = "${local.prefix}-usa"
  location = "West US"
}

module "usa-network" {
  source                = "../../modules/network"
  prefix                = "${local.prefix}-usa"
  resource_group_name   = "${azurerm_resource_group.usa.name}"
  location              = "${azurerm_resource_group.usa.location}"
  network_address_space = "12.0.0.0/16"
}
