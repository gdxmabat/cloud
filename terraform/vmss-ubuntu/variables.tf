

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


variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network. OJO ESTA CAMBIADO"
  default     = "gdxmabatresourcegroup"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "westus"
}

variable "storage_account_tier" {
  description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
  default     = "LRS"
}

variable "hostname" {
  description = "A string that determines the hostname/IP address of the origin server. This string could be a domain name, IPv4 address or IPv6 address. OJO ESTA CAMBIADO"
  default     = "servidor-gdxmabat-ubuntu"
}

variable "vm_sku" {
  description = "Size of VMs in the VM Scale Set."
  default     = "Standard_A1"
}

variable "ubuntu_os_version" {
  description = "The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values are: 15.10, 14.04.4-LTS."
  default     = "16.04.0-LTS"
}

variable "image_publisher" {
  description = "The name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}

variable "image_offer" {
  description = "The name of the offer (az vm image list)"
  default     = "UbuntuServer"
}

variable "vmss_name_prefix" {
  description = "String used as a base for naming resources. Must be 1-9 characters in length for windows and 1-58 for linux images and globally unique across Azure. A hash is prepended to this string for some resources, and resource-specific information is appended."
  default     = "prefix"
}

variable "instance_count" {
  description = "Number of VM instances (100 or less)."
  default     = "2"
}

variable "admin_username" {
  description = "Admin username on all VMs. OJO ESTA CAMBIADO"
  default     = "mario"
}

variable "admin_password" {
  description = "Admin password on all VMs. OJO ESTA CAMBIADO"
  default     = "Mario.Medina"
}