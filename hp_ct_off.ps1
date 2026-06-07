Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force -AllowClobber -AcceptLicense
Install-Module -Name HPCMSL -Scope AllUsers -Force -AcceptLicense
Import-Module HPCMSL
Get-HPBIOSSetting -Name "Absolute Persistence Module Current State"
Set-HPBIOSSettingValue -Name "Permanent Disable Absolute Persistence Module Set Once" -Value "Yes"