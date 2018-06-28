output "resource_group_name" {
  value = "${data.azurerm_resource_group.main.name}"
}

output "virtual_network_id" {
  value = "${azurerm_virtual_network.main.id}"
}

output "virtual_network_name" {
  value = "${azurerm_virtual_network.main.name}"
}

output "internal_subnet_name" {
  value = "${azurerm_subnet.internal.name}"
}

output "internal_subnet_id" {
  value = "${azurerm_subnet.internal.id}"
}
