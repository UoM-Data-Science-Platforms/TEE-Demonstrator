variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "rg-tee-demonstrator"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "uksouth"
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

variable "vm_name" {
  type        = string
  description = "Name of the confidential VM"
  default     = "tee-cvm-demo"
}

variable "vm_size" {
  type        = string
  description = "VM size (DCesv6-series confidential VM SKU)"
  default     = "Standard_DC2es_v6"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the confidential VM"
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  type        = string
  description = "SSH public key for the admin user (no default - must be supplied)"
}

variable "admin_source_ip" {
  type        = string
  description = "CIDR (e.g. 203.0.113.5/32) allowed to SSH into the VM via the NSG - no default, must be supplied"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the VM's virtual network"
  default     = ["10.20.0.0/16"]
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the VM's subnet"
  default     = ["10.20.1.0/24"]
}
