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

Use master
ALTER DATABASE tempdb
MODIFY FILE (NAME = tempdev, FILENAME = 'G:\SQLTMP\tempdb.mdf',
SIZE = 4096MB,
MAXSIZE = 10240MB,
FILEGROWTH = 1024MB)
GO
ALTER DATABASE tempdb
ADD FILE (NAME = tempdev_2, FILENAME = 'G:\SQLTMP\tempdev_2.mdf', SIZE = 4096MB, MAXSIZE=10240MB, FILEGROWTH = 1024MB) 
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev_3, FILENAME = 'G:\SQLTMP\tempdev1_3.mdf', SIZE = 4096MB, MAXSIZE=10240MB, FILEGROWTH = 1024MB) 
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev_4, FILENAME = 'G:\SQLTMP\tempdev_4.mdf', SIZE = 4096MB, MAXSIZE=10240MB, FILEGROWTH = 1024MB) 
GO