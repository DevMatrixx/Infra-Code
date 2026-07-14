resource "azurerm_resource_group" "rg" {
  for_each   = var.resource_groups
  name       = each.value.rg-name
  location   = each.value.rg-location
  tags       = each.value.rg-tags
  managed_by = each.value.rg-managed-by
}



