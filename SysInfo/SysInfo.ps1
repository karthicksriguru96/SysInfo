﻿Get-ChildItem -Path $PSScriptRoot\Public\*.ps1,$PSScriptRoot\Private\*.ps1 | ForEach-Object {. $_.Name}
