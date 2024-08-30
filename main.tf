provider "azurerm" {
  features {}
  version = "~> 3.0"  # Specify the version you want to use
}

# Define Resource Group
resource "azurerm_resource_group" "my_resource_group" {
  name     = "myResourceGroup2"
  location = "East US"
}

# Assign RBAC Roles
resource "azurerm_role_assignment" "group_role_assignment" {
  scope                = azurerm_resource_group.my_resource_group.id
  role_definition_name = "Contributor"
  principal_id         = "a05a35d0-498a-4975-9d2c-474fb0dcf4c8"  # Group objectId
}

resource "azurerm_role_assignment" "user_role_assignment" {
  scope                = azurerm_resource_group.my_resource_group.id
  role_definition_name = "Reader"
  principal_id         = "9a5f4e5a-9094-4396-8c17-8745fd68a4c2"  # User Id (John Doe)
}

# Define Policy Definition (if needed, adjust according to your needs)
resource "azurerm_policy_definition" "example_policy" {
  name         = "example-policy-definition"
  policy_type   = "Custom"
  mode          = "All"
  display_name  = "Example Policy"
  description   = "An example policy definition"

  policy_rule   = jsonencode({
    if = {
      field = "type"
      equals = "Microsoft.Storage/storageAccounts"
    }
    then = {
      effect = "deny"
    }
  })
}

# Assign Policy Definition
resource "azurerm_policy_assignment" "policy_assignment" {
  name                 = "example-policy-assignment"
  scope                = azurerm_resource_group.my_resource_group.id
  policy_definition_id = azurerm_policy_definition.example_policy.id
}
