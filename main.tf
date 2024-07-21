terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }
}

# Configuração do provedor da Azure
provider "azurerm" {
  features {}
}

# Criação do grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     =  var.resource_group_name       #"wordpress-rg"  # Nome do grupo de recursos
  location = var.location                   #"East US" # Localização do grupo de recursos
}

# Criação da rede virtual e sub-rede usando o módulo network
module "network" {
  source              = "./network"                      # Fonte do módulo de rede
  resource_group_name = azurerm_resource_group.rg.name   # Nome do grupo de recursos
  location            = azurerm_resource_group.rg.location # Localização do grupo de recursos
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}


# Criação da máquina virtual usando o módulo vm
module "vm" {
  source              = "./vm"                           # Fonte do módulo de VM
  resource_group_name = azurerm_resource_group.rg.name   # Nome do grupo de recursos
  location            = azurerm_resource_group.rg.location # Localização do grupo de recursos
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_id = module.network.network_interface_id
}

# Saída do endereço IP público da VM
# output "public_ip_address" {
#   value = module.vm.public_ip_address # Endereço IP público da VM
# }
