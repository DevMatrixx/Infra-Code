resource_groups = {
  "rg1" = {
    rg-name     = "Todo-resource-group"
    rg-location = "East US"
    rg-tags = {
      environment = "dev"
      project     = "Todoproject"
    }
    rg-managed-by = "Brijendra"
  }
}

virtual_networks = {
  "vnet1" = {
    vnet-name           = "Todo-virtual-network"
    vnet-location       = "East US"
    vnet-resource-group = "Todo-resource-group"
    vnet-address-space  = ["192.168.0.0/16"]
    vnet-subnets = [
      {
        vnet-subnet-name             = "Frontend-subnet"
        vnet-subnet-address-prefixes = ["192.168.1.0/24"]
      }
    ]
  }
}

public_ips = {
  "pip1" = {
    pip-name              = "Frontend-public-ip"
    pip-location          = "East US"
    pip-allocation-method = "Static"
    pip-resource-group    = "Todo-resource-group"
  }
}

network_interfaces = {
  "nic1" = {
    nic-name           = "Frontend-nic"
    nic-location       = "East US"
    nic-resource-group = "Todo-resource-group"
    nic-ip-config = [
      {
        name                          = "Frontend-ip-config"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }
}

key_vaults = {
  "kv1" = {
    name                = "Todo-key-vault"
    location            = "Central US"
    resource_group_name = "Keyvault-RG"
    sku_name            = "standard"
  }
}

key_vault_secrets = {
  "vm_admin_pass" = {
    name                = "vm-admin-user"
    value               = "vm-admin-password"
    key_vault_name      = "Todo-key-vault"
    resource_group_name = "Keyvault-RG"
  }
}

virtual_machines = {
  "vm1" = {
    name                       = "Frontend-vm"
    location                   = "East US"
    resource_group_name        = "Todo-resource-group"
    size                       = "Standard_B1s"
    admin_username             = "azureuser"
    key_vault_name             = "Todo-key-vault"
    admin_password_secret_name = "vm-admin-password"
    nic_name                   = "Frontend-nic"
    nic_resource_group_name    = "Todo-resource-group"
    publisher                  = "Canonical"
    offer                      = "0001-com-ubuntu-server-jammy"
    sku                        = "22_04-lts"
    version                    = "latest"
    os_disk_name               = "Frontend-vm-osdisk"
    caching                    = "ReadWrite"
    storage_account_type       = "Standard_LRS"
    tags = {
      environment = "dev"
      project     = "Todoproject"
    }
  }
}
