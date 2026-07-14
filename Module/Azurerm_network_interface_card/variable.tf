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