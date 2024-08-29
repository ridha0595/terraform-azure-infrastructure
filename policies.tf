
resource "azurerm_policy_definition" "example_policy" {
  name         = "example-policy"
  policy_type   = "Custom"
  mode          = "All"
  display_name  = "Example Policy"
  policy_rule   = jsonencode({
    "if" = {
      "field" = "location"
      "equals" = "East US"
    }
    "then" = {
      "effect" = "deny"
    }
  })
}

resource "azurerm_policy_assignment" "example_policy_assignment" {
  name                 = "example-policy-assignment"
  policy_definition_name = azurerm_policy_definition.example_policy.name
  scope               = azurerm_resource_group.rg.id
}
