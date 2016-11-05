<#

************************************************************************************************************************

Created:	2015-03-01
Version:	1.1

Disclaimer:
This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the author or DeploymentArtist.

Author - Johan Arwidmark
    Twitter: @jarwidmark
    Blog   : http://deploymentresearch.com

************************************************************************************************************************

#>

$SQLSetupFile = "C:\Setup\SQL Server 2014 Standard with SP1 x64\Setup.exe"
$SQLConfigurationFile = "C:\Setup\Scripts\HYDSQL2014Unattend.ini"

# Validation
if (!(Test-Path -path $SQLSetupFile)) {Write-Warning "Could not find SQL Server 2014 setup files, aborting...";Break}
if (!(Test-Path -path $SQLConfigurationFile)) {Write-Warning "Could not find SQL Server 2014 Unattend file, aborting...";Break}
if (!(Test-Path -path G:\)) {Write-Warning "Could not find SQL TempDB Volume, aborting...";Break}
if (!(Test-Path -path H:\)) {Write-Warning "Could not find SQL DB Volume, aborting...";Break}
if (!(Test-Path -path I:\)) {Write-Warning "Could not find SQL Logs Volume, aborting...";Break}

# Install SQL
& $SQLSetupFile /configurationfile=$SQLConfigurationFile