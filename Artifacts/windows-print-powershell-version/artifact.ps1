[CmdletBinding()]
param
(
)

Write-Output "PowerShell version is $([intPtr]::size * 4)-bit"

Write-Output "OS Version: $([environment]::OSVersion.Version.ToString())"
