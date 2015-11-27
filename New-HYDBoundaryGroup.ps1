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
$SiteServerFQDN = "$env:computername.$env:userdnsdomain"

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

# Create a boundary group and use this boundary group for site assignment
New-CMBoundaryGroup -Name "HQ Assignment" -DefaultSiteCode $SiteCode

# Add boundaries to the boundary group
Add-CMBoundaryToGroup -BoundaryName "corp.viamonstra.com/NewYork" -BoundaryGroupName "HQ Assignment"
Add-CMBoundaryToGroup -BoundaryName "corp.viamonstra.com/NewYork/192.168.1.0/24" -BoundaryGroupName "HQ Assignment"

# Add distribution points to the boundary group
Set-CMDistributionPoint -SiteCode $SiteCode -SiteSystemServerName $SiteServerFQDN -AddBoundaryGroupName "HQ Assignment"



