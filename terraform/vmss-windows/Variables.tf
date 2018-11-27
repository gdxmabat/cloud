#DEFINICION DE VARIABLES 


#AUTENTICACION. Necesario los 4 parametros 
#================================================================================
variable "subscription_id" {
  description = "Identificador de subscripcion azure"
  default     = "4c950822-b692-4f3a-a53f-40cc40aced2e"
	
}
variable "client_id" {
  description = "Identificador de cliente"
  default     = "8f6f1cfa-985d-4a0b-b247-93cc25d46ebf"

}
variable "client_secret" {
  description = "Contraseña cliente"
  default     = "52138f2c-ce4d-49fa-9108-f264cb16d405"

}
variable "tenant_id" {
  description = "Tenant ID"
  default     = "79add968-ae6e-433a-8aab-09abaa0fe1f6"
}



#VARIABLE PROPIAS DE AZURE 
#================================================================================
variable "azure_region" {
  default     = "centralus"  #Valorar usar otra region WEST EUROPE  (westeurope)
  description = "The location/region where the resources are created."
}

variable "azure_env" {
  default = "Dev"
  description = "This is the name of the environment tag, i.e. Dev, Test, etc."
}

variable "azure_rg_name" {
  default = "everilion" # This will get a unique timestamp appended
  description = "Specify the name of the new resource group"
}



#VARIABLE PROPIAS DE LA MV CREADA
#================================================================================
variable "username" {
  default = "mario"
  description = "Admin username for all VMs"
}

variable "password" {
  default = "Mario.Medina"
  description = "Admin password for all VMs"
}

variable "vm_size" {
  default = "Standard_DS2_v2"
  description = "Specify the VM Size"
}

variable "server_name" {
  default = "everilionserver"
  description = "Specify the hostname for the Chef server"
}

variable "dns_server_name" {
  default = "everilionserver-host1"
  description = "Specify the hostname for the Chef server"
}

variable "image_publisher" {
  description = "name of the publisher of the image (az vm image list)"
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "the name of the offer (az vm image list)"
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "image sku to apply (az vm image list)"
  default     = "2012-R2-Datacenter"
}

variable "image_version" {
  description = "version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "instances_number" {
  description = "Numero de instancias que se generan"
  default     = "2"
}
