output "resource_group_ids" {
  description = "Map of created Resource Group IDs"
  value       = { for k, v in azurerm_resource_group.rg : k => v.id }
}

output "resource_group_names" {
  description = "Map of created Resource Group names"
  value       = { for k, v in azurerm_resource_group.rg : k => v.name }
}

output "resource_group_locations" {
  description = "Map of created Resource Group locations"
  value       = { for k, v in azurerm_resource_group.rg : k => v.location }
}
