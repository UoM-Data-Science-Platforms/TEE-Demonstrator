variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "rg-tee-demonstrator"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "westeurope"
}

variable "storage_account_prefix" {
  type        = string
  description = "Prefix for the storage account name (must be alphanumeric, max 24 chars with random suffix)"
  default     = "teesa"
}

variable "environment" {
  type        = string
  description = "Target environment name (e.g. dev, prod)"
  default     = "dev"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default = {
    Project   = "TEE-demonstrator"
    ManagedBy = "Terraform"
  }
}
