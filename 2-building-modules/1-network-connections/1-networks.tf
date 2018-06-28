locals {
  prefix = "tom2mod"
}

resource "azurerm_resource_group" "uk" {
  name     = "${var.prefix}-uk"
  location = "UK South"
}

module "uk-network" {
  prefix              = "${local.prefix}-uk"
  resource_group_name = "${azurerm_resource_group.uk.name}"
  location            = "${azurerm_resource_group.uk.location}"
}

resource "azurerm_resource_group" "usa" {
  name     = "${var.prefix}-usa"
  location = "West US"
}

module "usa-network" {
  prefix              = "${local.prefix}-usa"
  resource_group_name = "${azurerm_resource_group.usa.name}"
  location            = "${azurerm_resource_group.usa.location}"
}
