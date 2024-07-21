# Saída do ID da sub-rede criada
output "subnet_id" {
  value = azurerm_subnet.subnet.id                      # ID da sub-rede criada
}

output "network_interface_id" {
 value = azurerm_network_interface.nic.id
}