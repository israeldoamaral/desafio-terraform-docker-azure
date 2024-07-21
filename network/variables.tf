# Variável para definir a localização dos recursos na Azure
variable "location" {
  description = "Localização onde os recursos serão criados." # Descrição da variável
  type        = string                                          # Tipo da variável
#   default     = "East US"                                       # Valor padrão da variável
}

# Variável para definir o nome do grupo de recursos
variable "resource_group_name" {
  description = "Nome do grupo de recursos onde os recursos serão criados." # Descrição da variável
  type        = string                                                      # Tipo da variável
#   default     = "wordpress-rg"                                              # Nome do grupo de recursos
}

# Variável para definir o espaço de endereço da VNet
variable "address_space" {
  description = "Espaço de endereço da rede virtual (VNet)." # Descrição da variável
  type        = list(string)                                 # Tipo da variável
#   default     = ["10.0.0.0/16"]                              # Valor padrão da variável
}

# Variável para definir o prefixo de endereço da sub-rede
variable "subnet_prefix" {
  description = "Prefixo de endereço da sub-rede." # Descrição da variável
  type        = list(string)                       # Tipo da variável
#   default     = ["10.0.1.0/24"]                    # Valor padrão da variável
}

variable "network_security_group_name" {
  description = "Nome do SG"
  type = string
  default = "NSG desafio"
}