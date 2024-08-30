terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"  # Specify the desired provider version
    }
  }
}

provider "azurerm" {
  features {}
}

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

resource "azurerm_resource_group" "my_resource_group" {
  name     = "myResourceGroup3"
  location = "East US"
}

# Uncomment and update if policy assignments are supported in your version
# resource "azurerm_policy_assignment" "policy_assignment" {
#   name                 = "example-policy-assignment"
#   scope                = azurerm_resource_group.my_resource_group.id
#   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"  # Policy def id
# }
