variable "resource_groups" {
  description = "A map of resource groups to create"
  type = map(object({
    rg-name       = string
    rg-location   = string
    rg-tags       = map(string)
    rg-managed-by = string
  }))
}

variable "virtual_networks" {
  description = "A map of virtual networks to create"
  type = map(object({
    vnet-name           = string
    vnet-location       = string
    vnet-resource-group = string
    vnet-address-space  = list(string)
    vnet-subnets = list(object({
      vnet-subnet-name             = string
      vnet-subnet-address-prefixes = list(string)
    }))
  }))
}

variable "public_ips" {
  description = "A map of public IPs to create"
  type = map(object({
    pip-name              = string
    pip-location          = string
    pip-allocation-method = string
    pip-resource-group    = string
  }))
}

variable "network_interfaces" {
  description = "A map of network interface configurations."
  type = map(object({
    nic-name           = string
    nic-location       = string
    nic-resource-group = string
    nic-ip-config = list(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "key_vaults" {
  description = "A map of key vaults to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
  }))
}

variable "key_vault_secrets" {
  description = "A map of key vault secrets to create"
  type = map(object({
    name                = string
    value               = string
    key_vault_name      = optional(string)
    resource_group_name = optional(string)
    key_vault_id        = optional(string)
    content_type        = optional(string)
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "virtual_machines" {
  description = "A map of virtual machine configurations"
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
  default = {}
}
