# Requires Internet Access, if not, use source
# Note: Script configured to reboot if needed
Add-WindowsFeature RDC,File-Services,FS-FileServer,Web-App-Dev,Web-Common-Http,Web-Default-Doc,Web-Dir-Browsing,Web-Filtering,Web-Health,Web-Http-Errors,Web-Http-Logging,Web-ISAPI-Ext,Web-Metabase,Web-Mgmt-Compat,Web-Mgmt-Console,Web-Mgmt-Tools,Web-Performance,Web-Security,Web-Server,Web-Stat-Compression,Web-Static-Content,Web-WebServer,Web-Windows-Auth,Web-WMI,Web-Http-Redirect,Web-Scripting-Tools -Restart


