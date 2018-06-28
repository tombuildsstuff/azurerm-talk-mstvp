provider "azurerm" {
  version = "=1.7.0"
}

resource "azurerm_resource_group" "test" {
  name     = "tom-dev2"
  location = "West Europe"

  tags {
    "Hello" = "Microsoft"
  }
}
