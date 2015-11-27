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


Import-Module $env:SMS_ADMIN_UI_PATH.Replace("\bin\i386","\bin\configurationmanager.psd1")
$SiteCode = Get-PSDrive -PSProvider CMSITE
Set-Location "$($SiteCode.Name):\"

# Create Folders in Device Collections
New-Item -Name 'Limiting Collections' -Path "$($SiteCode.Name):\DeviceCollection"
New-Item -Name 'OSD' -Path "$($SiteCode.Name):\DeviceCollection"
New-Item -Name 'Software' -Path "$($SiteCode.Name):\DeviceCollection"
New-Item -Name 'Software Updates' -Path "$($SiteCode.Name):\\DeviceCollection"
New-Item -Name 'Compliance Settings' -Path "$($SiteCode.Name):\DeviceCollection"

