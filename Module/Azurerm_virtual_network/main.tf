resource "azurerm_virtual_network" "vnet" {
  for_each            = var.virtual_networks
  name                = each.value.vnet-name
  location            = each.value.vnet-location
  resource_group_name = each.value.vnet-resource-group
  address_space       = each.value.vnet-address-space
  dynamic "subnet" {
    for_each = each.value.vnet-subnets
    content {
      name             = subnet.value.vnet-subnet-name
      address_prefixes = subnet.value.vnet-subnet-address-prefixes
    }
  }
}





