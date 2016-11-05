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
If (Test-Path C:\Setup\MDT2013U2\MicrosoftDeploymentToolkit2013_x64.msi){
    Write-Output "Setup files found, OK, continuing..."
    Write-Output ""
    } 
Else {
    Write-Warning "Oupps, cannot setup files, aborting..."
    Break
}

# Install MDT 2013
& msiexec.exe /i 'C:\Setup\MDT2013U2\MicrosoftDeploymentToolkit2013_x64.msi' /quiet