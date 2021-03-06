﻿function Get-RAMDisk 
{
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

      .PARAMETER Credential

      Specifies the credentials that will be used to get the information
      from remote system.

      .PARAMETER Authentication

      Specifies the authentication that will be used to connect to the
      remote system to get the information from.

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

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties.

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-RAMDisk

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-RAMDisk -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-ramdisk
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

    
  function Get-RAMDiskOnly
  {
    <#
        .SYNOPSIS
        Filters RAM Disk only.
    #>


    param
    (
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'Filters RAM Disk only')]
      $InputObject
    )
    process
    {
      if ($InputObject.DriveType -eq 'RAM Disk')
      {
        $InputObject
      }
    }
  }

  if ($Authentication -eq '') 
  {
    if ($Protocol -eq '') 
    {
      $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName -Credential $Credential -Properties $Properties | Get-RAMDiskOnly
    }
    else 
    {
      $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName -Credential $Credential -Protocol $Protocol -Properties $Properties | Get-RAMDiskOnly
    }
  }
  else 
  {
    if ($Protocol -eq '') 
    {
      $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Properties $Properties | Get-RAMDiskOnly
    }
    else 
    {
      $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $Properties | Get-RAMDiskOnly
    }
  }

  Write-Output -InputObject $RAMDisk
}
