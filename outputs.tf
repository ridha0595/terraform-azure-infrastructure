output "group_role_assignment_id" {
  value = azurerm_role_assignment.group_role_assignment.id
}

output "user_role_assignment_id" {
  value = azurerm_role_assignment.user_role_assignment.id
}

output "policy_assignment_id" {
  value = azurerm_policy_assignment.policy_assignment.id
}
