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

$SetupFile = "C:\Setup\ConfigMgr 1606\SMSSETUP\BIN\X64\setup.exe"
$ConfigurationFile = "C:\Setup\Scripts\HYDConfigMgr.ini"
$PreReqFile = "C:\Setup\ConfigMgr 1606 PreReqs\ConfigMgr.Manifest.cab"

# Validation
if (!(Test-Path -path $SetupFile)) {Write-Warning "Could not find ConfigMgr setup files, aborting...";Break}
if (!(Test-Path -path $PreReqFile)) {Write-Warning "Could not find ConfigMgr Prereq files, aborting...";Break}
if (!(Test-Path -path E:\)) {Write-Warning "Could not find Program Files Volume, aborting...";Break}

# Install ConfigMgr Current Branch
& $SetupFile /Script $ConfigurationFile /NoUserInput
