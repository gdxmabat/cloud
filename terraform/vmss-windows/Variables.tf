#DEFINICION DE VARIABLES 


#AUTENTICACION. Necesario los 4 parametros 
#================================================================================
variable "subscription_id" {
  description = "Identificador de subscripcion azure"
  default     = "param_subscription_id"
	
}
variable "client_id" {
  description = "Identificador de cliente"
  default     = "param_client_id"

}
variable "client_secret" {
  description = "Contraseña cliente"
  default     = "param_client_secret"

}
variable "tenant_id" {
  description = "Tenant ID"
  default     = "param_tenant_id"
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
  default     = "1"
}
