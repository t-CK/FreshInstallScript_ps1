# Get the make and model of computer
function Get-HWInfo {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Model)
}

# Get the manufacturer of system
function Get-Manufacturer {
    return (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty Manufacturer)
}

# Get installed Windows version
function Get-WinEdition {
    return (Get-CimInstance Win32_OperatingSystem).Caption
}

# Disable password expiration
function Set-PasswordExpiration {
    Write-Host "    Disabling password expiration"
    Set-LocalUser -Name $env:USERNAME -PasswordNeverExpires $true
}

# Install wmic to system
function Install-Wmic{
    # If windows edition is Home, install wmic
    if((Get-WinEdition).Contains("Home"))
    {
        Write-Host 'Installing wmic'
        Add-WindowsCapability -Online -Name wmic
    }
    # If windows edition has lusrmgr.msc, wmic is not needed
    else
    {
        Write-Host (Get-WinEdition)
        Write-Host 'wmic not needed'
    }
}

########## DEBUG ###############
Write-Host "Manufacturer: " (Get-Manufacturer)
Write-Host "Model: " (Get-HWInfo)`n
Install-Wmic
################################