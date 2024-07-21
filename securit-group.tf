# Definição do grupo de segurança de rede (NSG)
resource "azurerm_network_security_group" "nsg" {  
  name                = "wordpress-nsg" # Nome do NSG  
  location            = var.location  # Localização do NSG, fornecida como uma variável
  resource_group_name = var.resource_group_name # Nome do grupo de recursos onde o NSG será criado, fornecido como uma variável

  # Regra de segurança para permitir o tráfego SSH
  security_rule {
    name                       = "Allow-SSH"                      # Nome da regra
    priority                   = 1001                            # Prioridade da regra (quanto menor o número, maior a prioridade)
    direction                  = "Inbound"                        # Direção do tráfego (Inbound para entrada)
    access                     = "Allow"                          # Ação da regra (Allow para permitir)
    protocol                   = "Tcp"                            # Protocolo (TCP)
    source_port_range          = "*"                              # Intervalo de portas de origem (qualquer porta)
    destination_port_range     = "22"                             # Porta de destino (22 para SSH)
    source_address_prefix      = "0.0.0.0/0"                      # Prefixo de endereço de origem (qualquer IP)
    destination_address_prefix = "*"                              # Prefixo de endereço de destino (qualquer IP)
    description                = "Allow SSH access"               # Descrição da regra
  }

  # Regra de segurança para permitir o tráfego HTTP
  security_rule {
    name                       = "Allow-HTTP"                     # Nome da regra
    priority                   = 1002                            # Prioridade da regra
    direction                  = "Inbound"                        # Direção do tráfego (Inbound para entrada)
    access                     = "Allow"                          # Ação da regra
    protocol                   = "Tcp"                            # Protocolo (TCP)
    source_port_range          = "*"                              # Intervalo de portas de origem (qualquer porta)
    destination_port_range     = "80"                             # Porta de destino (80 para HTTP)
    source_address_prefix      = "0.0.0.0/0"                      # Prefixo de endereço de origem (qualquer IP)
    destination_address_prefix = "*"                              # Prefixo de endereço de destino (qualquer IP)
    description                = "Allow HTTP access"              # Descrição da regra
  }

  # Regra de segurança para permitir o tráfego HTTPS
  security_rule {
    name                       = "Allow-HTTPS"                    # Nome da regra
    priority                   = 1003                            # Prioridade da regra
    direction                  = "Inbound"                        # Direção do tráfego (Inbound para entrada)
    access                     = "Allow"                          # Ação da regra
    protocol                   = "Tcp"                            # Protocolo (TCP)
    source_port_range          = "*"                              # Intervalo de portas de origem (qualquer porta)
    destination_port_range     = "443"                            # Porta de destino (443 para HTTPS)
    source_address_prefix      = "0.0.0.0/0"                      # Prefixo de endereço de origem (qualquer IP)
    destination_address_prefix = "*"                              # Prefixo de endereço de destino (qualquer IP)
    description                = "Allow HTTPS access"             # Descrição da regra
  }

  # Regra de segurança para permitir todo o tráfego de saída
  security_rule {
    name                       = "Allow-All-Outbound"             # Nome da regra
    priority                   = 1004                            # Prioridade da regra
    direction                  = "Outbound"                       # Direção do tráfego
    access                     = "Allow"                          # Ação da regra
    protocol                   = "*"                              # Protocolo (qualquer protocolo)
    source_port_range          = "*"                              # Intervalo de portas de origem (qualquer porta)
    destination_port_range     = "*"                              # Intervalo de portas de destino (qualquer porta)
    source_address_prefix      = "*"                              # Prefixo de endereço de origem (qualquer IP)
    destination_address_prefix = "0.0.0.0/0"                      # Prefixo de endereço de destino (qualquer IP)
    description                = "Allow all outbound traffic"     # Descrição da regra
  }
}



# Associação do NSG com a interface de rede
resource "azurerm_network_interface_security_group_association" "nsg_association" {  
  network_interface_id      = module.network.network_interface_id.id  # ID da interface de rede que receberá o NSG 
  network_security_group_id = azurerm_network_security_group.nsg.id   # ID do NSG a ser associado
}
