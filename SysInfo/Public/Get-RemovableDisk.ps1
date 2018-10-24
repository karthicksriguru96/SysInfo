﻿function Get-RemovableDisk {
<#
.SYNOPSIS

Gets the information of a removable disk on a computer running
on a Windows operating system.

.DESCRIPTION

Gets the information of a removable disk on a computer running
on a Windows operating system and converts all codes in results
into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-RemovableDisk can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-RemovableDisk returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-RemovableDisk

.EXAMPLE

PS C:\> Get-RemovableDisk -ComputerName Server1

.EXAMPLE

PS C:\> Get-RemovableDisk -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-RemovableDisk -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-RemovableDisk -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-RemovableDisk -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-RemovableDisk -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-RemovableDisk

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-RemovableDisk

.EXAMPLE

PS C:\> "Server1" | Get-RemovableDisk

.EXAMPLE

PS C:\> "192.168.0.5" | Get-RemovableDisk

.LINK

https://www.sconstantinou.com/get-removabledisk
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $RemovableDisk = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'Removable Disk'}
    }
    else{

        $RemovableDisk = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'Removable Disk'}
    }

    Write-Output $RemovableDisk
}