# main.tf

provider "azurerm" {
  features {}
}

# Role Assignment
resource "azurerm_role_assignment" "example_role_assignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}

# Policy Definition
resource "azurerm_policy_definition" "example_policy_definition" {
  name         = var.policy_name
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny creation of resources in disallowed locations"
  policy_rule  = <<POLICY
  {
    "if": {
      "not": {
        "field": "location",
        "in": ${jsonencode(var.allowed_locations)}
      }
    },
    "then": {
      "effect": "deny"
    }
  }
  POLICY
}

# Policy Assignment
resource "azurerm_policy_assignment" "example_policy_assignment" {
  name                 = var.policy_assignment_name
  policy_definition_id = azurerm_policy_definition.example_policy_definition.id
  scope                = data.azurerm_subscription.primary.id
}

# Data Block to Fetch Subscription Information
data "azurerm_subscription" "primary" {}

