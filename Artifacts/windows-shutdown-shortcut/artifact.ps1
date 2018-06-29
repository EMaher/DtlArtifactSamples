[CmdletBinding()]
Param( )

#$scriptName = 'Shutdown.ps1'
$scriptName = 'Shutdown.cmd'

#get paths for all users desktops
$desktopPaths = @(Get-ChildItem "$env:HOMEDRIVE\Users\*\Desktop")
$fullPaths = $desktopPaths | ForEach-Object {$(Join-Path $_ $scriptName)}
Write-Output $fullPaths

#Copy files
$fullPaths | ForEach-Object {Copy-Item -Path $(Join-Path $PSScriptRoot $scriptName)  $_}

