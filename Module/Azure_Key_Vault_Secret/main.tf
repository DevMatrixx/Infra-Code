data "azurerm_key_vault" "kv" {
  for_each = {
    for k, v in var.key_vault_secrets : k => v
    if v.key_vault_id == null && v.key_vault_name != null
  }

  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.key_vault_secrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = each.value.key_vault_id != null ? each.value.key_vault_id : data.azurerm_key_vault.kv[each.key].id
  content_type = each.value.content_type
  tags         = each.value.tags
}
