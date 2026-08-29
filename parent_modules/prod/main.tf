

module "resource_group" {
source = "../../child_modules/azurerm_resource_group"
rgs = var.rgs
}

module "vnet" {
  depends_on = [module.resource_group]
  source = "../../child_modules/azurerm_virtual_network"
  my_vnet = var.virtual_networks
}


module "subnet" {
    depends_on = [module.vnet]
    source = "../../child_modules/azurerm_subnet"
    my_subnet = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source = "../../child_modules/azurerm_public_ip"
  public_ip = var.public_ip
}

module "vm" {
  depends_on = [ module.subnet, module.public_ip]
  source = "../../child_modules/azurerm_virtual_machine"
  vms = var.vms
}

