/*
module "uk-to-usa-pairing" {
  source = "../../modules/virtual-network-pairing"

  primary_network_id = "${module.uk-network.virtual_network_id}"
  primary_resource_group_name = "${azurerm_resource_group.uk.name}"

  secondary_network_id = "${module.usa-network.virtual_network_id}"
  secondary_resource_group_name = "${azurerm_resource_group.usa.name}"
}
*/

