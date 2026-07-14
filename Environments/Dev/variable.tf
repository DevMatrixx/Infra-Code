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