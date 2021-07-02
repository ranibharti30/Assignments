provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my-resources"
  location = "West Europe"
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = “my-resources”
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
  }


resource "azurerm_subnet" "example" {
  name                 = "subnetname1"
  resource_group_name  = “my-resources”
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_subnet" "example" {
  name                 = "subnetname2"
  resource_group_name  = “my-resources”
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}


resource "azurerm_network_security_group" "consul_nsg" {
  name                = "consul_nsg"
  location            = "westeurope"
  resource_group_name = "ExampleResourceGroup"

  security_rule {
    name                       = "ExampleSecurityRule"
    priority                   = 4010
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = [80, 443]
    source_address_prefix      = "*"
    destination_address_prefix = "VirtualNetwork"
  }
resource "azurerm_dev_test_windows_virtual_machine" "example" {
  name                   = "example-vm01"
  resource_group_name    = “my-resources”
  location               = azurerm_resource_group.example.location
  size                   = "Standard_DS2"
  username               = "exampleuser99"
  password               = "Pa$w0rd1234!"
  virtual_network_id = 	azurerm_dev_test_virtual_network.example.id
  subnet_name       = azurerm_dev_test_virtual_network.example.subnet[0].name
  storage_type           = "Premium"
  notes                  = "Some notes about this Virtual Machine."

  gallery_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_dev_test_windows_virtual_machine" "example" {
  name                   = "example-vm02"
  resource_group_name    = “my-resources”
  location               = azurerm_resource_group.example.location
  size                   = "Standard_DS2"
  username               = "exampleuser99"
  password               = "Pa$w0rd1234!"
  virtual_network_id = 	azurerm_dev_test_virtual_network.example.id
  subnet_name       = azurerm_dev_test_virtual_network.example.subnet[0].name
  storage_type           = "Premium"
 

  gallery_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = “my-resources”
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


  tags = {
    environment = "Prod"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.example]
}

