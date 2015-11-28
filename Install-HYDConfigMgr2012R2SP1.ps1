<#

************************************************************************************************************************

Created:	2015-03-01
Version:	1.1

Disclaimer:
This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the authors or DeploymentArtist.

Author - Johan Arwidmark
    Twitter: @jarwidmark
    Blog   : http://deploymentresearch.com

************************************************************************************************************************

#>

# Validation
if (!(Test-Path -path C:\Setup\CM2012R2SP1\SMSSETUP\BIN\X64\Configmgr2012R2SP1.msi)) {Write-Warning "Could not find ConfigMgr 2012 R2 SP1 setup file, aborting...";Break}
if (!(Test-Path -path E:\)) {Write-Warning "Could not find Program Files Volume, aborting...";Break}

# Install ConfigMgr 2012 R2 SP1
msiexec /i C:\Setup\ConfigMgr2012R2SP1\SMSSETUP\BIN\X64\Configmgr2012R2SP1.msi /q 