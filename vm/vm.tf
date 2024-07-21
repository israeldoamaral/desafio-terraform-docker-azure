# Criação da máquina virtual (VM)
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "wordpress-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids =  [var.network_interface_id] #[azurerm_network_interface.nic.id]
  size                = "Standard_B1s"

  # Configuração do disco do sistema operacional
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Referência da imagem do sistema operacional
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  # Configuração do administrador
  computer_name  = "wordpressvm"
  admin_username = var.admin_username
  admin_password = var.admin_password

  # Script de inicialização codificado em base64
  custom_data = filebase64("${path.module}/script.sh")

  tags = {
    environment = "Development"
  }
}
