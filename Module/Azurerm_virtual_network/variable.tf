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