<#

************************************************************************************************************************

Created:	2015-03-01
Version:	1.2

Disclaimer:
This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the authors or DeploymentArtist.

Author - Johan Arwidmark
    Twitter: @jarwidmark
    Blog   : http://deploymentresearch.com

************************************************************************************************************************

#>

Import-Module $env:SMS_ADMIN_UI_PATH.Replace("\bin\i386","\bin\configurationmanager.psd1")
Push-Location "$($(Get-PSDrive -PSProvider CMSITE).Name):"

# Create Folders in Device Collections
New-Item -Name 'Limiting Collections' -Path '\DeviceCollection'
New-Item -Name 'OSD' -Path '\DeviceCollection'
New-Item -Name 'Software' -Path '\DeviceCollection'
New-Item -Name 'Software Updates' -Path '\DeviceCollection'
New-Item -Name 'Compliance Settings' -Path '\DeviceCollection'

Pop-Location
