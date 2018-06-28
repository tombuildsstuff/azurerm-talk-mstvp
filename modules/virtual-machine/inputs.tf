variable "resource_group_name" {
  description = "The name of the Resource Group in which the Virtual Machine should be created."
}

variable "virtual_machine_name" {
  description = "The name of the Virtual Machine"
}

variable "network_name" {
  description = "The name of the Virtual Network in which the Subnet this Virtual Machine should be created in exists."
}

variable "subnet_name" {
  description = "The name of the Subnet in which this Virtual Machine should be created."
}

variable "network_resource_group_name" {
  description = "The name of the Resource Group in which the Network this machine should be in exists."
}

variable "virtual_machine_size" {
  description = "The size of the Virtual Machine"
  default     = "Standard_F2"
}

variable "os_disk_type" {
  description = "The Type of Managed Disk which should be used for this Virtual Machine, such as `Standard_LRS` or `Premium_LRS`."
  default     = "Standard_LRS"
}

variable "assign_public_ip" {
  description = "Should a Public IP Address be assigned?"
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "admin_username" {}
variable "admin_password" {}

variable "image_publisher" {
  default = "Canonical"
}

variable "image_offer" {
  default = "UbuntuServer"
}

variable "image_sku" {
  default = "18.04-LTS"
}
