terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  
  # somente local
  # subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup"
  location = "eastus"
}

resource "azurerm_cosmosdb_account" "production_cosmosdb" {
  name                = var.production_cosmosdb_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }

  consistency_policy {
    consistency_level = "Session"
  }
}

resource "azurerm_cosmosdb_mongo_database" "production_mongo_database" {
  name                = var.production_db_name
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.production_cosmosdb.name
}

resource "azurerm_cosmosdb_mongo_collection" "production_collection" {
  name                = "ProductionOrders"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.production_cosmosdb.name
  database_name       = azurerm_cosmosdb_mongo_database.production_mongo_database.name
  throughput          = 400

  index {
    keys = ["_id"]
  }
}
