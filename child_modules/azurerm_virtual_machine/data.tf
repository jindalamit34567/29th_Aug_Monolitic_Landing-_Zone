data "azurerm_subnet" "data-subnets" {
  for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "frontend-pip" {
  for_each = var.vms
  name                = each.value.pip_name
  resource_group_name = "amitjindal-rg-1"
}

