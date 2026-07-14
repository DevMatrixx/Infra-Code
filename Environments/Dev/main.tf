module "resource_group" {
  source              = "../../Module/Azurerm_resource_group"
  resource_groups     = var.resource_groups
}

module "virtual_network" {
    depends_on          = [module.resource_group]
  source              = "../../Module/Azurerm_virtual_network"
  virtual_networks    = var.virtual_networks
}

module "public_ip" {
    depends_on = [module.resource_group]
  source              = "../../Module/Azurerm_public_ip"
  public_ips          = var.public_ips
}

module "network_interface" {
  depends_on = [module.resource_group, module.virtual_network, module.public_ip]  
  source              = "../../Module/Azurerm_network_interface_card"
  network_interfaces  = var.network_interfaces
}
