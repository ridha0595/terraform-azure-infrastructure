# Provider Configuration
provider "azurerm" {
  features {}
}

# Define the resource group
resource "azurerm_resource_group" "example" {
  name     = "myResourceGroup2"
  location = "East US"
}

# Define the policy definition
resource "azurerm_policy_definition" "example_policy" {
  name         = "example-policy"
  policy_type   = "Custom"
  mode          = "All"
  policy_rule   = <<POLICY_RULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Compute/virtualMachines"
  },
  "then": {
    "effect": "deny"
  }
}
POLICY_RULE
}

# Assign the policy to the resource group
resource "azurerm_policy_assignment" "example_policy_assignment" {
  name                 = "example-policy-assignment"
  scope                = azurerm_resource_group.example.id
  policy_definition_id = azurerm_policy_definition.example_policy.id
}
