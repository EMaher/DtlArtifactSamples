Param(

  [ValidateSet("GB", "Ireland")]
  [string]
  $Region
)
Write-Output "Region: $Region" 

# Change Regional Settings to GB
If ($Region -eq 'GB')
{
    & $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"GBRegion.xml`""
    # Set Timezone
    & tzutil /s "GMT Standard Time"
    # Set Culture to GB
    Set-Culture en-GB 
    Write-Output "Setting to GB."
}

# Change Regional Settings to IE
Elseif ($Region -eq 'Ireland')
{
    & $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"IERegion.xml`""
    # Set Timezone
    & tzutil /s "GMT Standard Time"
    # Set Culture to IE
    Set-Culture en-IE 

    Write-Output "Setting to IE."

}
