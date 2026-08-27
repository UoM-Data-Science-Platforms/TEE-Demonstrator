terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.storage_account_prefix)}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

resource "azapi_update_resource" "disable_blob_soft_delete" {
  type        = "Microsoft.Storage/storageAccounts/blobServices@2022-09-01"
  resource_id = "${azurerm_storage_account.sa.id}/blobServices/default"

  body = jsonencode({
    properties = {
      deleteRetentionPolicy = {
        enabled = false
      }
      containerDeleteRetentionPolicy = {
        enabled = false
      }
    }
  })
}
