####################################################################################
##  File:  Install-AzureCosmosDbEmulator.ps1
##  Desc:  Install Azure CosmosDb Emulator
####################################################################################

Import-Module -Name ImageHelpers -Force

$InstallerName = "AzureCosmosDBEmulator.msi"
$InstallerUrl = "https://aka.ms/cosmosdb-emulator"

Install-Binary -Url $InstallerUrl -Name $InstallerName