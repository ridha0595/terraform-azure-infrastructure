variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "myResourceGroup2"
}

variable "location" {
  description = "The Azure region to deploy resources into"
  type        = string
  default     = "East US"
}
