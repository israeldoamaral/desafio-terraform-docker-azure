# Variável para o nome de usuário do administrador
variable "admin_username" {
  description = "O nome de usuário do administrador para a VM"
  type        = string
  default = "kassia"
}

# Variável para a senha do administrador
variable "admin_password" {
  description = "A senha do administrador para a VM"
  type        = string
  sensitive   = true
  default = "aw3se4dr5"
}

# Variável para definir a localização dos recursos na Azure
variable "location" {
  description = "Localização onde os recursos serão criados." # Descrição da variável
  type        = string                                          # Tipo da variável
  default     = "East US"                                       # Valor padrão da variável
}

# Variável para definir o nome do grupo de recursos
variable "resource_group_name" {
  description = "Nome do grupo de recursos onde os recursos serão criados." # Descrição da variável
  type        = string                                                      # Tipo da variável
  default     = "wordpress-rg"                                              # Nome do grupo de recursos
}

# Variável para definir o nome do grupo de segurança de rede (NSG)
variable "network_security_group_name" {
  description = "Nome do grupo de segurança de rede (NSG)." # Descrição da variável
  type        = string                                      # Tipo da variável
  default     = "wordpress-nsg"                             # Valor padrão da variável
}

# Variável para definir o nome da rede virtual (VNet)
variable "virtual_network_name" {
  description = "Nome da rede virtual (VNet)." # Descrição da variável
  type        = string                         # Tipo da variável
  default     = "wordpress-vnet"               # Valor padrão da variável
}

# Variável para definir o espaço de endereço da VNet
variable "address_space" {
  description = "Espaço de endereço da rede virtual (VNet)." # Descrição da variável
  type        = list(string)                                 # Tipo da variável
  default     = ["10.0.0.0/16"]                              # Valor padrão da variável
}

# Variável para definir o nome da sub-rede
variable "subnet_name" {
  description = "Nome da sub-rede dentro da VNet." # Descrição da variável
  type        = string                             # Tipo da variável
  default     = "wordpress-subnet"                 # Valor padrão da variável
}

# Variável para definir o prefixo de endereço da sub-rede
variable "subnet_prefix" {
  description = "Prefixo de endereço da sub-rede." # Descrição da variável
  type        = list(string)                       # Tipo da variável
  default     = ["10.0.1.0/24"]                    # Valor padrão da variável
}


