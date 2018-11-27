#CREACION DE IP PUBLICA PARA LA MAQUINA VM.
#================================================================================
resource "azurerm_public_ip" "win_pubip" {
  name                         = "win_pubip${count.index}"
  location                     = "${var.azure_region}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  count		                   = "${var.instances_number}"
  
  
  
  #La ip se define dinamica (podria ser estatica)
  public_ip_address_allocation = "dynamic"
  
  #Definicion del DNS de la maquina
  domain_name_label            = "${var.dns_server_name}${count.index}"
  tags {
    environment = "${var.azure_env}"
  }
}


#CREACION DE INTERFAZ DE RED Y ASIGNACION DE VLAN/SUBNET
#================================================================================
resource "azurerm_network_interface" "win_ip" {
  name			                = "win_ip${count.index}"
  location      			    = "${var.azure_region}"
  resource_group_name 		    = "${azurerm_resource_group.rg.name}"
  count		                    = "${var.instances_number}"
 
  ip_configuration {
    name      = "win_ipconf${count.index}"
    subnet_id = "${azurerm_subnet.subnet.id}"
    #La definicion de IP se realiza estatica. 
	#private_ip_address_allocation = "static"
	#private_ip_address            = "10.1.1.10"
	
	#Definicion de ip private como dinamica
	private_ip_address_allocation = "dynamic"
	
	public_ip_address_id          =  "${element(azurerm_public_ip.win_pubip.*.id,count.index)}"
	}
}


#CREACION DE LA MAQUINA VIRTUAL
#================================================================================
resource "azurerm_virtual_machine" "win" {
  name                  = "${var.server_name}${count.index}"
  location              = "${var.azure_region}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${element(azurerm_network_interface.win_ip.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"
  count		            = "${var.instances_number}"
  
  
  storage_image_reference {
    #publisher = "MicrosoftWindowsServer"
    #offer     = "WindowsServer"
    #sku       = "2016-Datacenter"
    #version   = "latest"
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  
  }

  storage_os_disk {
    name              = "osdisk${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.server_name}"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
    custom_data    = "${file("./files/winrm.ps1")}"
  }

  os_profile_windows_config {
    provision_vm_agent = true
    winrm = {
      protocol = "http"
    }
    # Auto-Login's required to configure WinRM
    additional_unattend_config {
      pass         = "oobeSystem"
      component    = "Microsoft-Windows-Shell-Setup"
      setting_name = "AutoLogon"
      content      = "<AutoLogon><Password><Value>${var.password}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount><Username>${var.username}</Username></AutoLogon>"
    }

    # Unattend config is to enable basic auth in WinRM, required for the provisioner stage.
    additional_unattend_config {
      pass         = "oobeSystem"
      component    = "Microsoft-Windows-Shell-Setup"
      setting_name = "FirstLogonCommands"
      content      = "${file("./files/FirstLogonCommands.xml")}"
    }
  }
  
  

  tags {
    environment = "${var.azure_env}"
  }

  connection {
    host     = "${element(azurerm_public_ip.win_pubip.*.fqdn, count.index)}"
	type     = "winrm"
    port     = 5985
    https    = false
    timeout  = "2m"
    user     = "${var.username}"
    password = "${var.password}"
  }
  
  #Se copia config.ps1 en la maquina remota
  provisioner "file" {
    source      = "files/config.ps1"
    destination = "c:/terraform/config.ps1"
  }
  
    provisioner "file" {
    source      = "files/SetupIIS.ps1"
    destination = "c:/terraform/SetupIIS.ps1"
  }
  
  #Se ejecuta ps1 en la maquina remota
  provisioner "remote-exec" {
    inline = [
      "PowerShell.exe -ExecutionPolicy Bypass c:\\terraform\\config.ps1",
    ]
  }
  
    provisioner "remote-exec" {
    inline = [
      "PowerShell.exe -ExecutionPolicy Bypass c:\\terraform\\SetupIIS.ps1",
    ]
  }
  
}



#La tarea finaliza devolviendo el dns del servidor creado.
output "cfqdn" {
  value = "${azurerm_public_ip.win_pubip.*.fqdn}"
}
