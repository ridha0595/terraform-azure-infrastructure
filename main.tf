provider "azurerm" {
  features {}
}

# Define the resource group (if it doesn't exist)
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Fetch existing policy assignment using the correct name
data "azurerm_policy_assignment" "example" {
  name     = "ASC Default"  # Policy assignment name
  scope    = "/subscriptions/${var.subscription_id}"  # Subscription-level scope
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "policy_assignment_id" {
  value = data.azurerm_policy_assignment.example.id
}
