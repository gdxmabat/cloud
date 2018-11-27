# * Make sure you run this script from a Powershel Admin Prompt!
# * Make sure Powershell Execution Policy is bypassed to run these scripts:
# * YOU MAY HAVE TO RUN THIS COMMAND PRIOR TO RUNNING THIS SCRIPT!
Set-ExecutionPolicy Bypass -Scope Process

# To list all Windows Features: dism /online /Get-Features
# Get-WindowsOptionalFeature -Online 
# LIST All IIS FEATURES: 
# Get-WindowsOptionalFeature -Online | where FeatureName -like 'IIS-*'

Disable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Disable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Disable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Disable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
Disable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment

Disable-WindowsOptionalFeature -online -FeatureName NetFx4Extended-ASPNET45
Disable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45

Disable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
Disable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
Disable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries
Disable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
Disable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
Disable-WindowsOptionalFeature -Online -FeatureName IIS-Security
Disable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
Disable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
Disable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Disable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
Disable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
Disable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
Disable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication
Disable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
Disable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
Disable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
Disable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45

# If you need classic ASP (not recommended)
Disable-WindowsOptionalFeature -Online -FeatureName IIS-ASP


#REM The following optional components require 
#REM Chocolatey OR Web Platform Installer to install

#REM Install UrlRewrite Module for Extensionless Urls (optional)
#REM & "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" /install /Products:UrlRewrite2 /AcceptEULA /SuppressPostFinish
choco uninstall urlrewrite -y

#REM Install WebDeploy for Deploying to IIS (optional)
#REM & "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" /install /Products:WDeployNoSMO /AcceptEULA /SuppressPostFinish
choco uninstall webdeploy -y