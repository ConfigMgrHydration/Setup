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

# Validation
Write-Output "Checking for setup files"
If (Test-Path E:\Setup\WindowsADK10\adksetup.exe){
    Write-Output "Setup files found, OK, continuing..."
    Write-Output ""
    } 
Else {
    Write-Warning "Oupps, cannot setup files, aborting..."
    Break
}

# Install Windows ADK 10
& 'E:\Setup\WindowsADK10\adksetup.exe' /Features OptionId.DeploymentTools OptionId.WindowsPreinstallationEnvironment OptionId.UserStateMigrationTool /norestart /quiet /ceip off