output "secret_ids" {
  description = "Map of secret keys to Key Vault secret resource IDs"
  value       = { for k, s in azurerm_key_vault_secret.secret : k => s.id }
}

output "secret_names" {
  description = "Map of secret keys to Key Vault secret names"
  value       = { for k, s in azurerm_key_vault_secret.secret : k => s.name }
}

output "secret_values" {
  description = "Map of secret keys to secret values"
  value       = { for k, s in azurerm_key_vault_secret.secret : k => s.value }
  sensitive   = true
}

output "key_vault_secrets" {
  description = "Map of full key vault secret objects"
  value       = azurerm_key_vault_secret.secret
  sensitive   = true
}
