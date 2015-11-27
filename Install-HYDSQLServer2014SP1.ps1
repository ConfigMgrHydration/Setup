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
If (Test-Path E:\Setup\SQL2014SP1\setup.exe){
    Write-Output "Setup files found, OK, continuing..."
    Write-Output ""
    } 
Else {
    Write-Warning "Oupps, cannot setup files, aborting..."
    Break
}

& E:\Setup\SQL2014SP1\setup.exe /configurationfile=E:\Setup\Scripts\SQL2014Unattend.ini