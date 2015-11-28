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

# Check for elevation
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Oupps, you need to run this script from an elevated PowerShell prompt!`nPlease start the PowerShell prompt as an Administrator and re-run the script."
	Write-Warning "Aborting script..."
    Break
}

$SourcePath = 'E:\Sources'

New-Item -Path $SourcePath -ItemType Directory
New-Item -Path "$SourcePath\OSD" -ItemType Directory
New-Item -Path "$SourcePath\OSD\Boot" -ItemType Directory
New-Item -Path "$SourcePath\OSD\DriverPackages" -ItemType Directory
New-Item -Path "$SourcePath\OSD\DriverSources" -ItemType Directory
New-Item -Path "$SourcePath\OSD\MDT" -ItemType Directory
New-Item -Path "$SourcePath\OSD\OS" -ItemType Directory
New-Item -Path "$SourcePath\OSD\Settings" -ItemType Directory

New-Item -Path "$SourcePath\Software" -ItemType Directory
New-Item -Path "$SourcePath\Software\Adobe" -ItemType Directory
New-Item -Path "$SourcePath\Software\Microsoft" -ItemType Directory
New-Item -Path "$SourcePath\Software\CMClient" -ItemType Directory
New-Item -Path "$SourcePath\Software Updates" -ItemType Directory

New-SmbShare –Name Sources –Path $SourcePath –FullAccess EVERYONE