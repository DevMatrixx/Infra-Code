resource "azurerm_key_vault" "vault" {
  for_each                   = var.key_vaults
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled = true
  public_network_access_enabled = true
  sku_name                   = each.value.sku_name


  network_acls {
    default_action = "Deny"
    bypass         = "None"

    ip_rules = [
      "20.94.196.105"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Delete", "Update"
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Recover", "Purge"
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
}
