﻿function Get-RAMDisk {
<#
.SYNOPSIS

Gets the information about a RAM disk on a computer running on
a Windows operating system.

.DESCRIPTION

Gets the information about a a RAM disk on a computer running on
a Windows operating system and converts all codes in results into
human readable format.

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

System.Array. Get-RAMDisk can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-RAMDisk returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-RAMDisk

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-RAMDisk

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-RAMDisk -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-ramdisk
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    if ($Protocol -eq ''){

        $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName -Properties $Properties | Where-Object {$_.DriveType -eq 'RAM Disk'}}
    else{

        $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties | Where-Object {$_.DriveType -eq 'RAM Disk'}}

    Write-Output $RAMDisk
}