locals {
  network_interface_name = "${var.virtual_machine_name}-ni01"
  public_ip_name         = "${var.virtual_machine_name}-pip01"
}

resource "azurerm_public_ip" "main" {
  count = "${var.assign_public_ip == "true" ? 1 : 0}"

  name                         = "${local.public_ip_name}"
  location                     = "${data.azurerm_resource_group.main.location}"
  resource_group_name          = "${data.azurerm_resource_group.main.name}"
  public_ip_address_allocation = "static"
  tags                         = "${var.tags}"
}

locals {
  public_ip_id      = "${element(concat(azurerm_public_ip.main.*.id, list("")), 0)}"
  public_ip_address = "${element(concat(azurerm_public_ip.main.*.ip_address, list("")), 0)}"
}

resource "azurerm_network_interface" "main" {
  name                = "${local.network_interface_name}"
  location            = "${data.azurerm_resource_group.main.location}"
  resource_group_name = "${data.azurerm_resource_group.main.name}"

  ip_configuration {
    name                          = "primary"
    subnet_id                     = "${data.azurerm_subnet.main.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${local.public_ip_id}"
  }

  tags = "${var.tags}"
}
