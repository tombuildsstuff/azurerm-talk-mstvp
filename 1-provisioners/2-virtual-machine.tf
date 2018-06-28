locals {
  vm_username = "tharvey"
  vm_password = "Password1234!"
}

resource "azurerm_resource_group" "virtual-machine" {
  name     = "${local.prefix}-vm-resources"
  location = "${local.location}"
}

module "virtual-machine" {
  source               = "../modules/virtual-machine"
  resource_group_name  = "${azurerm_resource_group.virtual-machine.name}"
  virtual_machine_name = "${local.prefix}-vm01"

  # Network
  network_resource_group_name = "${module.network.resource_group_name}"
  network_name                = "${module.network.virtual_network_name}"
  subnet_name                 = "${module.network.internal_subnet_name}"

  admin_username = "${local.vm_username}"
  admin_password = "${local.vm_password}"

  assign_public_ip = "true"
}

module "install-golang" {
  source     = "../modules/install-golang"
  ip_address = "${module.virtual-machine.public_ip_address}"
  username   = "${local.vm_username}"
  password   = "${local.vm_password}"
}
