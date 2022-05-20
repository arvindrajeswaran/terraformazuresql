# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "example" {
  name                         = var.sqlname
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sqlusername
  administrator_login_password = var.sqlpassword
}

resource "azurerm_mssql_database" "test" {
  name           = var.databasename
  server_id      = azurerm_mssql_server.example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  #license_type   = "LicenseIncluded"
  max_size_gb    = 50
  read_scale     = false
  #sku_name       = "S2"
  zone_redundant = true
  sample_name = "AdventureWorksLT"
  tags = {
    Environment = "AzureSQL-Terraform"
  }
    threat_detection_policy { //enable Microsoft Defender for SQL 
    state                      = "Enabled"
    storage_endpoint = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
  }
}
resource "azurerm_mssql_server" "example2" {
  name                         = var.sqlname2
  resource_group_name          = var.resource_group_name
  location                     = var.location2
  version                      = "12.0"
  administrator_login          = var.sqlusername
  administrator_login_password = var.sqlpassword
}

