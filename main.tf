provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "databricks_rg" {
  name     = "databricks-rg"
  location = "East US"  # Change to your desired Azure region
}

resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-workspace"
  resource_group_name = azurerm_resource_group.databricks_rg.name
  location            = azurerm_resource_group.databricks_rg.location
  sku                 = "premium"

  tags = {
    environment = "production"
  }
}

resource "azurerm_databricks_workspace_secret_scope" "example" {
  workspace_resource_id = azurerm_databricks_workspace.example.id
  name                  = "example"
}

resource "azurerm_databricks_cluster" "example" {
  resource_group_name   = azurerm_resource_group.databricks_rg.name
  location              = azurerm_resource_group.databricks_rg.location
  workspace_name        = azurerm_databricks_workspace.example.name
  node_type_id          = "Standard_DS3_v2"  # Change to your desired VM size
  spark_version         = "7.3.x-scala2.12"
  auto_scaling {
    min_workers = 2
    max_workers = 5
  }
  # Additional configuration options as needed
}

