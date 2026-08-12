data "azurerm_network_interface" "nic" {
  for_each = {
    for k, v in var.virtual_machines : k => v
    if v.nic_name != null
  }

  name                = each.value.nic_name
  resource_group_name = coalesce(each.value.nic_resource_group_name, each.value.resource_group_name)
}

data "azurerm_key_vault" "kv" {
  for_each = {
    for k, v in var.virtual_machines : k => v
    if v.key_vault_name != null && (v.admin_password_secret_name != null || v.ssh_key_secret_name != null)
  }

  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each = {
    for k, v in var.virtual_machines : k => v
    if v.admin_password_secret_name != null && v.key_vault_name != null
  }

  name         = each.value.admin_password_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "ssh_key" {
  for_each = {
    for k, v in var.virtual_machines : k => v
    if v.ssh_key_secret_name != null && v.key_vault_name != null
  }

  name         = each.value.ssh_key_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.virtual_machines
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = coalesce(each.value.size, each.value.vm_size, "Standard_B1s")

  admin_username                  = each.value.admin_username
  disable_password_authentication = each.value.disable_password_authentication

  admin_password = each.value.admin_password_secret_name != null ? (
    data.azurerm_key_vault_secret.admin_password[each.key].value
  ) : each.value.admin_password

  network_interface_ids = each.value.network_interface_ids != null ? each.value.network_interface_ids : [
    data.azurerm_network_interface.nic[each.key].id
  ]

  dynamic "admin_ssh_key" {
    for_each = (each.value.ssh_key_secret_name != null || each.value.ssh_public_key != null) ? [1] : []
    content {
      username = each.value.admin_username
      public_key = each.value.ssh_key_secret_name != null ? (
        data.azurerm_key_vault_secret.ssh_key[each.key].value
      ) : each.value.ssh_public_key
    }
  }

  os_disk {
    name                 = coalesce(each.value.os_disk_name, "${each.value.name}-osdisk")
    caching              = coalesce(each.value.caching, "ReadWrite")
    storage_account_type = coalesce(each.value.storage_account_type, each.value.managed_disk_type, "Standard_LRS")
    disk_size_gb         = each.value.disk_size_gb
  }

  source_image_reference {
    publisher = coalesce(each.value.publisher, "Canonical")
    offer     = coalesce(each.value.offer, "0001-com-ubuntu-server-jammy")
    sku       = coalesce(each.value.sku, "22_04-lts")
    version   = coalesce(each.value.version, "latest")
  }

  tags = each.value.tags
}