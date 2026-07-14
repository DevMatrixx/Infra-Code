resource "azurerm_public_ip" "pip" {
  for_each            = var.public_ips
  name                = each.value.pip-name
  location            = each.value.pip-location
  allocation_method   = each.value.pip-allocation-method
  resource_group_name = each.value.pip-resource-group
}


