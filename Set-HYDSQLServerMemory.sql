/************************************************************************************************************************

Created:	2015-03-01
Version:	1.1
Homepage:    	http://deploymentfundamentals.com

Disclaimer:
This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the authors or DeploymentArtist.

Author - Johan Arwidmark
    Twitter: @jarwidmark
    Blog   : http://deploymentresearch.com

************************************************************************************************************************/

EXEC sp_configure 'show advanced options', '1'
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'max server memory', '12288'
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'min server memory', '8192'
RECONFIGURE WITH OVERRIDE
EXEC sp_configure 'show advanced options', '0'
RECONFIGURE WITH OVERRIDE