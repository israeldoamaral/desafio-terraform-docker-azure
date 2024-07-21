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

# Variável para o nome de usuário do administrador
variable "admin_username" {
  description = "O nome de usuário do administrador para a VM"
  type        = string
#   default     = "kassia"
}

# Variável para a senha do administrador
variable "admin_password" {
  description = "A senha do administrador para a VM"
  type        = string
  sensitive   = true
#   default = "aw3se4dr5"
}

variable "network_interface_id" {
  description = "ID da interface de rede"
  type        = string
}