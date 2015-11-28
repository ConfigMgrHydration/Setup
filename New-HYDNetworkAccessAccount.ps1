param (
[string]$SiteCode,
[string]$UserDomain,
[string]$UserName,
[string]$UnencryptedPassword
)
 
Write-Output "Importing module..."
Import-Module ($Env:SMS_ADMIN_UI_PATH.Substring(0,$Env:SMS_ADMIN_UI_PATH.Length-5) + '\ConfigurationManager.psd1')
Write-Output "Done importing module. Will set location..."
Write-Output "Boot Image Path: $Path"
 
$CMSite = (Get-PSDrive | Where { $_.Provider -like "*CMSite" } | Select -First 1).Name
$CMDrive = $CMSite + ':'
Set-Location $CMDrive
   
$FullUserName = "$UserDomain\$UserName"
 
$Password = ConvertTo-SecureString $UnencryptedPassword -AsPlainText -Force
New-CMAccount -Name $FullUserName -Password $Password -SiteCode $SiteCode
Set-CMSoftwareDistributionComponent -NetworkAccessAccount $FullUserName -SiteCode $SiteCode