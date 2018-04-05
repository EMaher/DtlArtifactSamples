[CmdletBinding()]
param
(
    [Parameter(Mandatory=$true)]
    [string] $artifactParam
)

Write-Output "Parameter value is $artifactParam"
