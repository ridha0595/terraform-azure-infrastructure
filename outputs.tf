output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.example.id
}

output "policy_assignment_id" {
  description = "The ID of the policy assignment."
  value       = data.azurerm_policy_assignment.example.id
}
