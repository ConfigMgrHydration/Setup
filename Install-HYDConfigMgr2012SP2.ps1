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
If (Test-Path E:\Setup\ConfigMgr2012SP2\SMSSETUP\BIN\X64\setup.exe){
    Write-Output "Setup files found, OK, continuing..."
    Write-Output ""
    } 
Else {
    Write-Warning "Oupps, cannot setup files, aborting..."
    Break
}

# Install ConfigMgr 2012 SP2
E:\Setup\ConfigMgr2012SP2\SMSSETUP\BIN\X64\setup.exe /Script E:\Setup\Scripts\CM2012Unattend.ini /NoUserInput
