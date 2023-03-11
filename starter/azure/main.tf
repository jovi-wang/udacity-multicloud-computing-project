data "azurerm_resource_group" "udacity" {
  name = "Regroup_5y_hrteb2KJ5yw"
  # location = "eastus"
}

resource "azurerm_container_group" "udacity" {
  name                = "udacity-continst"
  location            = data.azurerm_resource_group.udacity.location
  resource_group_name = data.azurerm_resource_group.udacity.name
  ip_address_type     = "Public"
  dns_name_label      = "udacity-jovi-azure"
  os_type             = "Linux"

  container {
    name   = "azure-container-app"
    image  = "docker.io/tscotto5/azure_app:1.0"
    cpu    = "0.5"
    memory = "1.5"
    environment_variables = {
      "AWS_S3_BUCKET"       = "udacity-jovi-aws-s3-bucket",
      "AWS_DYNAMO_INSTANCE" = "udacity-jovi-aws-dynamodb"
    }
    ports {
      port     = 3000
      protocol = "TCP"
    }
  }
  tags = {
    environment = "udacity"
  }
}

####### Your Additions Will Start Here ######
resource "azurerm_storage_account" "jovi-storage-account" {
  name                     = "jovistorageaccount"
  resource_group_name      = data.azurerm_resource_group.udacity.name
  location                 = data.azurerm_resource_group.udacity.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_mssql_server" "jovi-mssql-server" {
  name                         = "jovi-mssql-server"
  resource_group_name          = data.azurerm_resource_group.udacity.name
  location                     = data.azurerm_resource_group.udacity.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  tags = {
    environment = "production"
  }
}

resource "azurerm_service_plan" "jovi-service-plan" {
  name                = "jovi-service-plan"
  resource_group_name = data.azurerm_resource_group.udacity.name
  location            = data.azurerm_resource_group.udacity.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "jovi-web-app" {
  name                = "jovi-web-app"
  resource_group_name = data.azurerm_resource_group.udacity.name
  location            = data.azurerm_resource_group.udacity.location
  service_plan_id     = azurerm_service_plan.jovi-service-plan.id

  site_config {}
}