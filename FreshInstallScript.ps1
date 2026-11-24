# Get the make and model of computer
function Get-HWInfo {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Model)
}

# Get the manufacturer of system
function Get-Manufacturer {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Manufacturer)
}

# Disable password expiration
function Set-PasswordExpiration {
    Write-Host "    Disabling password expiration"
    Set-LocalUser -Name $env:USERNAME -PasswordNeverExpires $true
}

########## DEBUG ###############
Write-Host "Manufacturer: " (Get-Manufacturer)
Write-Host "Model: " (Get-HWInfo)
################################