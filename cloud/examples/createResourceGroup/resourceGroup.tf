provider "azurerm" {
}
resource "azurerm_resource_group" "rg" {
        name = "gdxmabatResourceGroup"
        location = "westus"
}
