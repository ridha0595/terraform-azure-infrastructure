variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "myResourceGroup2"
}

variable "location" {
  description = "The Azure region to deploy resources into."
  type        = string
  default     = "East US"
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  default     = "d8f2a6e5-bd9a-4299-b4ea-eaff1d8e8455"
}
