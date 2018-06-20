[CmdletBinding()]
Param(
  [ValidateSet("GB", "Ireland")]
  [string]
  $Region
)

#Create Scripts folder to hold all scripts
$ScriptBase = "$env:HOMEDRIVE\TimeZoneScripts"
New-Item $ScriptBase -ItemType Directory -Force | Out-Null

#Get list of needes scripts
$ChangeTimeZoneScripts = 
@(
    'Set-TimeZone.ps1',
    'Set-TimeZone.cmd',
    'GBRegion.xml',
    'IERegion.xml'
)

#Copy files
$ChangeTimeZoneScripts | ForEach-Object {Copy-Item -Path $(Join-Path $PSScriptRoot $_)  $ScriptBase}

#Create Scripts folder for Startup
$GpoStartupFolder = "$([System.Environment]::SystemDirectory)\GroupPolicy\Machine\Scripts\Startup"
New-Item $GpoStartupFolder -ItemType Directory -Force | Out-Null

#Create link to scripts in startup
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("$GpoStartupFolder\Set-TimeZone.lnk")
$ShortCut.TargetPath="$(Join-Path $ScriptBase 'Set-TimeZone.cmd')"
$ShortCut.Arguments=$Region
$ShortCut.WorkingDirectory = $ScriptBase;
$ShortCut.WindowStyle = 1;
$ShortCut.IconLocation = "powershell.exe, 0";
$ShortCut.Description = "Set time zone to local to $Region";
$ShortCut.Save()

#Create link to scripts in startup
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("$ScriptBase\Set-TimeZone-$Region.lnk")
$ShortCut.TargetPath="$(Join-Path $ScriptBase 'Set-TimeZone.cmd')"
$ShortCut.Arguments=$Region
$ShortCut.WorkingDirectory = $ScriptBase;
$ShortCut.WindowStyle = 1;
$ShortCut.IconLocation = "powershell.exe, 0";
$ShortCut.Description = "Set time zone to local to $Region";
$ShortCut.Save()

#Create link to scripts from desktop for new users
# $Shell = New-Object -ComObject ("WScript.Shell")
# $ShortCut = $Shell.CreateShortcut("$env:HOMEDRIVE\Users\Default\Desktop\SetTimeZone.lnk")
# $ShortCut.TargetPath="$(Join-Path $ScriptBase Set-TimeZone.cmd)"
# $ShortCut.Arguments="GB"
# $ShortCut.WorkingDirectory = $ScriptBase;
# $ShortCut.WindowStyle = 1;
# $ShortCut.IconLocation = "powershell.exe, 0";
# $ShortCut.Description = "Set time zone to local";
# $ShortCut.Save()