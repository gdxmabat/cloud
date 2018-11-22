#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID=4c950822-b692-4f3a-a53f-40cc40aced2e
export ARM_CLIENT_ID=8f6f1cfa-985d-4a0b-b247-93cc25d46ebf
export ARM_CLIENT_SECRET=52138f2c-ce4d-49fa-9108-f264cb16d405
export ARM_TENANT_ID=79add968-ae6e-433a-8aab-09abaa0fe1f6

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public

