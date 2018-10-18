﻿Function Get-PrinterStatus {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            1 {'Other'}
            2 {'Unknown'}
            3 {'Idle'}
            4 {'Printing'}
            5 {'Warmup'}
            6 {'Stopped Printing'}
            7 {'Offline'}
            default {'Invalid Code'}
        }
    }

    Return
}