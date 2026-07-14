variable "resource_groups" {
  description = "A map of resource groups to create"
  type = map(object({
    rg-name       = string
    rg-location   = string
    rg-tags       = map(string)
    rg-managed-by = string
  }))
}