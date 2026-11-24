# Get the make and model of computer
function Get-HWInfo {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Model)
}

########## DEBUG ###############
Write-Host "Model: " (Get-HWInfo)
################################