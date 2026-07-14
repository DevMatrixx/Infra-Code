data "azurerm_subnet" "subnet" {
    resource_group_name = "Todo-resource-group"
    virtual_network_name = "Todo-virtual-network"
    name = "Todo-subnet"
}

data "azurerm_public_ip" "pip" {
    name = "Todo-public-ip"
    resource_group_name = "Todo-resource-group"
}