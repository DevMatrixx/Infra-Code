variable "public_ips" {
  description = "A map of public IPs to create"
  type = map(object({
    pip-name              = string
    pip-location          = string
    pip-allocation-method = string
    pip-resource-group    = string
  }))
}