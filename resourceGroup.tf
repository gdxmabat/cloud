provider "azurerm" {
    subscription_id = "4c950822-b692-4f3a-a53f-40cc40aced2e"
    client_id       = "8f6f1cfa-985d-4a0b-b247-93cc25d46ebf"
    client_secret   = "52138f2c-ce4d-49fa-9108-f264cb16d405"
    tenant_id       = "79add968-ae6e-433a-8aab-09abaa0fe1f6"
}

resource "azurerm_resource_group" "rg" {
        name = "gdxmabatResourceGroup"
        location = "westus"
}
