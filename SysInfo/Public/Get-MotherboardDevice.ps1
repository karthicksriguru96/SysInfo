﻿function Get-MotherboardDevice {
<#
.SYNOPSIS

Gets the information about a device that contains the central
components of the Windows computer system.

.DESCRIPTION

Gets the information about a device that contains the central
components of the Windows computer system and converts all
codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-MotherboardDevice can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-MotherboardDevice returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-MotherboardDevice

This command gets the information from local system

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-MotherboardDevice

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-motherboarddevice
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_MotherboardDevice'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','Status','Availability','PrimaryBusType','SecondaryBusType','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $MotherboardDevice = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $MotherboardDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Optimize-Output -Object $MotherboardDevice -Properties $Properties -DefaultProperties $DefaultProperties
}