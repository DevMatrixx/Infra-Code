variable "virtual_machines" {
  description = "Map of virtual machine configurations for Azure compute child module"
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = optional(string)
    vm_size                         = optional(string)
    admin_username                  = string
    admin_password                  = optional(string)
    disable_password_authentication = optional(bool, false)
    ssh_public_key                  = optional(string)
    key_vault_name                  = optional(string)
    admin_password_secret_name      = optional(string)
    ssh_key_secret_name             = optional(string)
    nic_name                        = optional(string)
    nic_resource_group_name         = optional(string)
    network_interface_ids           = optional(list(string))
    publisher                       = optional(string, "Canonical")
    offer                           = optional(string, "0001-com-ubuntu-server-jammy")
    sku                             = optional(string, "22_04-lts")
    version                         = optional(string, "latest")
    os_disk_name                    = optional(string)
    caching                         = optional(string, "ReadWrite")
    storage_account_type            = optional(string, "Standard_LRS")
    managed_disk_type               = optional(string)
    disk_size_gb                    = optional(number)
    computer_name                   = optional(string)
    tags                            = optional(map(string), {})
  }))
}
