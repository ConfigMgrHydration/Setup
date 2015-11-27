<#

************************************************************************************************************************

Created:	2015-03-01
Version:	1.1
Homepage:   http://deploymentfundamentals.com

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

# Enable Active Directory Forest Discovery
Set-CMDiscoveryMethod -ActiveDirectoryForestDiscovery `
 -SiteCode $SiteCode `
 -EnableActiveDirectorySiteBoundaryCreation $true `
 -EnableSubnetBoundaryCreation $true `
 -Enabled $true

 # Wait 30 seconds
 Sleep 30
 
#Run the Active Directory Forest Discovery
Invoke-CMForestDiscovery -SiteCode $SiteCode -Verbose
