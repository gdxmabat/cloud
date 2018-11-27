# CONFIGURACION DE LA INFRASTRUCTA GENERIA

#Proveedor de servicio. Credenciales de acceso a azure
#=============================================================================
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}



#Creacion del grupo de recursos sobre los que se asociaran todos los objetos que se definan
#=============================================================================
resource "azurerm_resource_group" "rg" {
  name     = "${var.azure_rg_name}-grupo" 
  location = "${var.azure_region}"
}



#Creacion de la red virtual
#=============================================================================
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.azure_rg_name}_Network"
  address_space       = ["10.1.0.0/16"]
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}



#Se crea una subred para alojar a los servidores
#=============================================================================
resource "azurerm_subnet" "subnet" {
  name                 = "${var.azure_rg_name}_Subnet"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.1.1.0/24"
}



#Definicion de las politicas de seguridad para estas maquinas
#=============================================================================
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.azure_rg_name}_nsg"
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  
  # Permite acceso por RDP (escritorio remoto)
  security_rule {
    name                       = "Allow_RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
  
  # Permite acceso ejecucion de WinRM (necesario para el aprovisionamiento)
  security_rule {
    name                       = "Allow_WinRM"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  # Permiste acceso ejecucion Apache (solo pruebas)
  security_rule {
    name                       = "Allow_Apache"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  # Permiste acceso ejecucion Apache (solo pruebas)
  security_rule {
    name                       = "Allow_Apache_8080"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  # Se incluye tag para identificacion de componentes
  tags {
    environment = "${var.azure_env}"
  }
}

resource "azurerm_subnet_network_security_group_association" "relationnetgroup" {
  subnet_id                 = "${azurerm_subnet.subnet.id}"
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"
}
