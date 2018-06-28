module "uk-to-usa-pairing" {
  source = "../../modules/virtual-network-peering"

  primary_network_name        = "${module.uk-network.virtual_network_name}"
  primary_resource_group_name = "${azurerm_resource_group.uk.name}"

  secondary_network_name        = "${module.usa-network.virtual_network_name}"
  secondary_resource_group_name = "${azurerm_resource_group.usa.name}"
}
