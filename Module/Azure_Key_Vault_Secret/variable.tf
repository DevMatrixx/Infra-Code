variable "key_vault_secrets" {
  description = "Map of Key Vault secrets to create"
  type = map(object({
    name                = string
    value               = string
    key_vault_name      = optional(string)
    resource_group_name = optional(string)
    key_vault_id        = optional(string)
    content_type        = optional(string)
    tags                = optional(map(string), {})
  }))
}
