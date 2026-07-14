resource "azurerm_network_interface" "nic" {
  for_each            = var.network_interfaces
  name                = each.value.nic-name
  location            = each.value.nic-location
  resource_group_name = each.value.nic-resource-group

  dynamic "ip_configuration" {
    for_each = each.value.nic-ip-config
    content {
      name                          = ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.subnet.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.pip.id
    }
  }
}


