output "virtual_machine_ids" {
  description = "Map of virtual machine names to their resource IDs"
  value       = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.id }
}

output "virtual_machine_names" {
  description = "Map of key identifiers to virtual machine names"
  value       = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.name }
}

output "virtual_machine_private_ip_addresses" {
  description = "Map of virtual machine names to their primary private IP addresses"
  value       = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.private_ip_address }
}

output "virtual_machines" {
  description = "Map of full virtual machine object attributes"
  value       = azurerm_linux_virtual_machine.vm
  sensitive   = true
}
