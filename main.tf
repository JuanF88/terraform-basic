
// Resource Group Process ////////////////////////////////////////

resource "azurerm_resource_group" "grp-01" {
  name     = local.resource_group_name
  location = local.location
}

// Storage Account and Blob ////////////////////////////////////////


/*
resource "azurerm_storage_account" "storage12321001" {
  count                    = 1
  name                     = "${count.index}storage121032"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  depends_on               = [azurerm_resource_group.grp-01]
}
*/
/*
resource "azurerm_storage_container" "newcontainer" {
  for_each = {
    0 = "data"
    1 = "files"
    2 = "media"
    
  }
  name                  = each.value
  storage_account_name  = "${each.key}storage121001asd"
  container_access_type = "blob"
  depends_on            = [azurerm_storage_account.storage12321001]
}

resource "azurerm_storage_blob" "maintf" {
  for_each = {
    sample1 = "C:\\terraform\\main.tfplan"
    sample2 = "C:\\terraform\\files\\file02.txt"
    sample3 = "C:\\terraform\\files\\file03.txt"
  }
  name                   = "${each.key}.txt"
  storage_account_name   = "1storage12321001"
  storage_container_name = "files"
  type                   = "Block"
  source                 = each.value
  depends_on             = [azurerm_storage_container.newcontainer]
}

*/
/*
Creation of a VM based in a Windows ////////////////////////////////////////

//Defintion of key for a Linux VM
resource "tls_private_key" "linuxKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
//Defintion of a local file for the key Linux VM
resource "local_file" "linuxpemkey" {
  filename   = "linuxkey.pem"
  content    = tls_private_key.linuxKey.public_key_openssh
  depends_on = [tls_private_key.linuxKey]
}

resource "azurerm_linux_virtual_machine" "vmLinux01" {
  name                = "vmLinux01"
  resource_group_name = local.resource_group_name
  location            = local.location
  size                = "Standard_D2s_V3"
  admin_username      = "juanadmin"
  network_interface_ids = [
    azurerm_network_interface.appinterface.id
  ]

  //aplly the key for the VM 
  admin_ssh_key {
    username   = "juanadmin"
    public_key = tls_private_key.linuxKey.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  depends_on = [
    azurerm_network_interface.appinterface,
    azurerm_resource_group.grp-01,
    tls_private_key.linuxKey
  ]

}

creation of other disk to atach in a VM

resource "azurerm_managed_disk" "appdisk" {
  name                 = "appdisk"
  location             = local.location
  resource_group_name  = local.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "2"
}

resource "azurerm_virtual_machine_data_disk_attachment" "appdiskatach" {
  managed_disk_id    = azurerm_managed_disk.appdisk.id
  virtual_machine_id = azurerm_windows_virtual_machine.vmwindows1.id
  lun                = "0"
  caching            = "ReadWrite"
}
*/




// App service ////////////////////////////////////////
/*
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "azure-functions-test-service-plan"
  location            = local.location
  resource_group_name = local.resource_group_name
  kind                = "elastic"


  sku {
    tier = "WorkflowStandard"
    size = "WS1"
  }

  depends_on = [azurerm_resource_group.grp-01]
}

*/

/* Service Plan

resource "azurerm_service_plan" "appServicePlanLinux" {
  name                = "logicAppServicePlan"
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = "Linux"
  sku_name            = "WS1"
}


resource "azurerm_service_plan" "appServicePlanWindows" {
  name                = "logicAppServicePlan2"
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = "Windows"
  sku_name            = "WS1"
}
*/

/*
// Web app ////////////////////////////////////////
resource "azurerm_app_service" "appService1" {
  name                = "appservice9213810"
  location            = local.location
  resource_group_name = local.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appServicePlan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

  depends_on = [ azurerm_app_service_plan.appServicePlan ]
}

*/
//Logic app ////////////////////////////////////////

/*
resource "azurerm_logic_app_standard" "logicApp" {
  name                       = "logicAppTest5523422"
  location                   = local.location
  resource_group_name        = local.resource_group_name
  app_service_plan_id        = azurerm_service_plan.appServicePlanWindows.id
  storage_account_name       = azurerm_storage_account.storage12321001[0].name
  storage_account_access_key = azurerm_storage_account.storage12321001[0].primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "dotnet"
    "WEBSITE_NODE_DEFAULT_VERSION" = "8"
  }

  depends_on = [azurerm_service_plan.appServicePlanWindows,
  azurerm_storage_account.storage12321001]
}
*/

/*
//outuput variable in a console when the plan is apply
output "subnet1-id" {
  value = azurerm_subnet.subnet1.id
}
*/