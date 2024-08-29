# outputs.tf

output "role_assignment_id" {
  value = azurerm_role_assignment.example_role_assignment.id
}

output "policy_definition_id" {
  value = azurerm_policy_definition.example_policy_definition.id
}

output "policy_assignment_id" {
  value = azurerm_policy_assignment.example_policy_assignment.id
}
