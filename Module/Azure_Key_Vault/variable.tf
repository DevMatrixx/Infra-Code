variable "key_vaults" {
  description = "A map of key vaults to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
  }))
}
