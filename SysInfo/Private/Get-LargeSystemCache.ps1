﻿Function Get-LargeSystemCache 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-LargeSystemCache -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint32]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      0 
      {
        'Optimize for Applications'
      }
      1 
      {
        'Optimize for System Performance'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
