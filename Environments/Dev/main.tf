module "resource_group" {
  source          = "../../Module/Azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../Module/Azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azurerm_public_ip"
  public_ips = var.public_ips
}

module "network_interface" {
  depends_on         = [module.resource_group, module.virtual_network, module.public_ip]
  source             = "../../Module/Azurerm_network_interface_card"
  network_interfaces = var.network_interfaces
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azure_Key_Vault"
  key_vaults = var.key_vaults
}

module "key_vault_secret" {
  depends_on        = [module.key_vault]
  source            = "../../Module/Azure_Key_Vault_Secret"
  key_vault_secrets = var.key_vault_secrets
}

module "compute" {
  depends_on       = [module.resource_group, module.network_interface, module.key_vault_secret]
  source           = "../../Module/compute"
  virtual_machines = var.virtual_machines
}
