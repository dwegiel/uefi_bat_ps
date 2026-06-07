Install-Module -Name UEFIv2 -Force
Import-Module UEFIv2
Get-UEFIVariable -All
Get-UEFIVariable -VariableName "AUTOPILOT_MARKER" -Namespace "{616e2ea6-af89-7eb3-f2ef-4e47368a657b}"
Set-UEFIVariable -VariableName "AUTOPILOT_MARKER" -Namespace "{616e2ea6-af89-7eb3-f2ef-4e47368a657b}" -Value ""