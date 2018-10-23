﻿Function Get-Keyboard {
<#
.SYNOPSIS

Gets the information about a keyboard installed on a computer
system running Windows.

.DESCRIPTION

Gets the information about a keyboard installed on a computer
system running Windows and converts all codes in results into
human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-Keyboard can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Keyboard returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Keyboard

.EXAMPLE

PS C:\> Get-Keyboard -ComputerName Server1

.EXAMPLE

PS C:\> Get-Keyboard -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Keyboard -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Keyboard -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Keyboard -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Keyboard -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Keyboard

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Keyboard

.EXAMPLE

PS C:\> "Server1" | Get-Keyboard

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Keyboard

.LINK

https://www.sconstantinou.com/get-keyboard
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_Keyboard).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $Keyboard = Get-CimInstance -ClassName Win32_Keyboard -Property $Properties | Select-Object $Properties
    }
    else {

        $Keyboard = Get-CimInstance -ClassName Win32_Keyboard -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Keyboard){

        $_.Layout = Get-Layout ($_.Layout)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Keyboard
}