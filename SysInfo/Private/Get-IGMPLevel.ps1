﻿Function Get-IGMPLevel {

    param ([uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'No Multicast'}
            1 {'IP Multicast'}
            2 {'IP & IGMP multicast'}
            default {'Invalid Code'}
        }
    }

    Return
}