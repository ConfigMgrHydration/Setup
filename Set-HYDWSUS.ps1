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

$SQLServerName = "cm01.corp.viamonstra.com"
$WSUSContentFolder = "E:\WSUS"
$WSUSUtil = "$($Env:ProgramFiles)\Update Services\Tools\WsusUtil.exe"
$WSUSUtilArgs = "POSTINSTALL SQL_INSTANCE_NAME=$SQLServerName CONTENT_DIR=$WSUSContentFolder usecustomwebsite true"
Start-Process -FilePath $WSUSUtil -ArgumentList $WSUSUtilArgs -NoNewWindow -Wait