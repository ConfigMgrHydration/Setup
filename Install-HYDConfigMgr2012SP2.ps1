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
if (!(Test-Path -path C:\Setup\CM2012SP2\SMSSETUP\BIN\X64\setup.exe)) {Write-Warning "Could not find ConfigMgr 2012 SP2 setup files, aborting...";Break}
if (!(Test-Path -path C:\Setup\CM2012SP2DL\ConfigMgr.Manifest.cab)) {Write-Warning "Could not find ConfigMgr 2012 SP2 Prereq files, aborting...";Break}
if (!(Test-Path -path E:\)) {Write-Warning "Could not find Program Files Volume, aborting...";Break}

# Install ConfigMgr 2012 SP2
C:\Setup\CM2012SP2\SMSSETUP\BIN\X64\setup.exe /Script C:\Setup\Scripts\HYDCM2012Unattend.ini /NoUserInput
