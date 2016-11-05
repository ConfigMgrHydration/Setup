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
if (!(Test-Path -path C:\Setup\WindowsADK10\adksetup.exe)) {Write-Warning "Could not find Windows 10 ADK v1607 Setup files, aborting...";Break}

# Install Windows ADK 10
& 'C:\Setup\WindowsADK10\adksetup.exe' /Features OptionId.DeploymentTools OptionId.WindowsPreinstallationEnvironment OptionId.UserStateMigrationTool /norestart /quiet /ceip off