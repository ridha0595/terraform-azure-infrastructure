# variables.tf

variable "role_definition_name" {
  description = "Name of the role to assign (e.g., 'Contributor', 'Reader')."
  type        = string
}

variable "principal_id" {
  description = "The ID of the principal to assign the role to."
  type        = string
}

variable "policy_name" {
  description = "The name of the custom policy to create."
  type        = string
}

variable "policy_assignment_name" {
  description = "The name of the policy assignment."
  type        = string
}

variable "allowed_locations" {
  description = "The list of allowed locations for resources."
  type        = list(string)
  default     = ["eastus", "westus"]  # Example allowed locations
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
