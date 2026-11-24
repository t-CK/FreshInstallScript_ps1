# Get the make and model of computer
function Get-HWInfo {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Model)
}

# Get the manufacturer of system
function Get-Manufacturer {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Manufacturer)
}

########## DEBUG ###############
Write-Host "Manufacturer: " (Get-Manufacturer)
Write-Host "Model: " (Get-HWInfo)
################################