<#

************************************************************************************************************************

Created:	2015-03-01
Version:	1.1
Homepage:  	http://deploymentfundamentals.com
credits:	James Bannan

Disclaimer:
This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the authors or DeploymentArtist.

Author - Johan Arwidmark
    Twitter: @jarwidmark
    Blog   : http://deploymentresearch.com

************************************************************************************************************************

#>

$SiteServer = $Env:COMPUTERNAME

Function Get-SiteCode
{
    $wqlQuery = “SELECT * FROM SMS_ProviderLocation”
    $a = Get-WmiObject -Query $wqlQuery -Namespace "root\sms" -ComputerName $SiteServer
    $a | ForEach-Object {
        if($_.ProviderForLocalSite)
            {
                $script:SiteCode = $_.SiteCode
            }
    }
return $SiteCode
}

$SiteCode = Get-SiteCode

$NameSpace = "root\SMS\site_$SiteCode"

# Import the ConfigMgr module
if (-not (Test-Path -Path $SiteCode))
    {
        Write-Verbose "$(Get-Date):   ConfigMgr module has not been imported yet, will import it now."
        Import-Module ($env:SMS_ADMIN_UI_PATH.Substring(0,$env:SMS_ADMIN_UI_PATH.Length – 5) + '\ConfigurationManager.psd1') | Out-Null
    }
# Set location to ConfigMgr PowerShell drive (ConfigMgr 2012 cmdlets need to be run from the drive)
Set-Location "$($SiteCode):" | Out-Null
if (-not (Get-PSDrive -Name $SiteCode))
    {
        Write-Error "There was a problem loading the Configuration Manager powershell module and accessing the site's PSDrive."
        exit 1
    }

# Enable Active Directory  System Discovery
  
Set-CMDiscoveryMethod -ActiveDirectorySystemDiscovery `
  -SiteCode $SiteCode `
  -EnableDeltaDiscovery $true `
  -Enabled $true
 
#  Add Active Directory Organizational Units
 
$ADSysDiscovery = Get-CimInstance -ComputerName $SiteServer `
    -Namespace $NameSpace `
    -ClassName SMS_SCI_Component `
    -Filter 'ComponentName ="SMS_AD_SYSTEM_DISCOVERY_AGENT"'
 
$ADContainerProp = $ADSysDiscovery.PropLists | Where-Object {$_.PropertyListName -eq 'AD Containers'}

if ($ADContainerProp.Values -eq $null){
  $ADContainerProp.Values = 'LDAP://OU=Domain Controllers,DC=corp,DC=viamonstra,DC=com',0,1
  }
  else {
  $ADContainerProp.Values += 'LDAP://OU=Domain Controllers,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com'
  $ADContainerProp.Values += '0'
  $ADContainerProp.Values += '1'
  }
   
if ($ADContainerProp.Values -eq $null){
  $ADContainerProp.Values = 'LDAP://OU=Servers,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com',0,1
  }
  else {
  $ADContainerProp.Values += 'LDAP://OU=Servers,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com'
  $ADContainerProp.Values += '0'
  $ADContainerProp.Values += '1'
  }
 
if ($ADContainerProp.Values -eq $null){
  $ADContainerProp.Values = 'LDAP://OU=Workstations,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com',0,1
  }
  else {
  $ADContainerProp.Values += 'LDAP://OU=Workstations,OU=ViaMonstra,DC=corp,DC=viamonstra,DC=com'
  $ADContainerProp.Values += '0'
  $ADContainerProp.Values += '1'
  }
 
Get-CimInstance -ComputerName $SiteServer `
    -Namespace $NameSpace `
    -ClassName SMS_SCI_Component `
    -Filter 'ComponentName ="SMS_AD_SYSTEM_DISCOVERY_AGENT"' | Set-CimInstance -Property @{PropLists=$ADSysDiscovery.PropLists}