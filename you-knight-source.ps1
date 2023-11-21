<#
.SYNOPSIS
A simple, text-based adventure game written in PowerShell
 
.DESCRIPTION
This script implements a short game using PowerShell. The game is a text-based adventure game set in the medival era. 
You play as an aspiring young knight, sent out by your king on an adventure to find Blargh, hero of the kingdom, who has mysteriously gone missing.

.NOTES
Author: Christian Belarde 
Version 1.0
Production Began Nov, 2023 
#>

# Setting up the sleep timer function for message pacing in seconds
function sleepTimerS {
    param($seconds)
    Start-Sleep -Seconds ($seconds)
}
# Setting up the sleep timer function for message pacing in milliseconds
function sleepTimerM {
    param($seconds)
    Start-Sleep -Milliseconds ($seconds)
}

function write {
    param($message)
    Write-Host ($message)
}
# This is supposed to hide the file path and make things look a little prettier in the console, needs work
function prompt { 
    $p = Split-Path -leaf -path (Get-Location)  
    \"$p> \" 
}
# creates a blank spacer
function space {
    write ""
}
#function for creating fast scrolling text
function writeFastScroll {
    param($Text)
    ForEach ($Character in $Text.ToCharArray()) {
        Write-Host -NoNewLine  $Character
        sleepTimerM 50
    }
}



function intro {
   <# write "   
 _______      _                                                   
(_______)    | |                                                  
 _         __| |  ___    ____     ____  _____  ____   _____   ___ 
| |       / _  | / _ \  / _  |   / _  |(____ ||    \ | ___ | /___)
| |_____ ( (_| || |_| |( (_| |  ( (_| |/ ___ || | | || ____||___ |
 \______) \____| \___/  \___ |   \___ |\_____||_|_|_||_____)(___/ 
                       (_____|  (_____|                           
 ______                                                           
(_____ \                                      _                   
 _____) )  ____  _____   ___  _____  ____   _| |_   ___           
|  ____/  / ___)| ___ | /___)| ___ ||  _ \ (_   _) /___)          
| |      | |    | ____||___ || ____|| | | |  | |_ |___ | _  _  _  
|_|      |_|    |_____)(___/ |_____)|_| |_|   \__)(___/ (_)(_)(_)
"
    for($i = 1; $i -le 5; $i++ ) {
        sleepTimerM 500
        write ""
    }

    write "
---      ---   --------   ----    ----      ----    ---- ----    ---- --------  ------------ ----    ---- ------------ 
 ***    ***   **********  ****    ****      ****   ****  *****   **** ********  ************ ****    **** ************ 
  ---  ---   ----    ---- ----    ----      ----  ----   ------  ----   ----    ----         ----    ---- ------------ 
   ******    ***      *** ****    ****      *********    ************   ****    ****  ****** ************     ****     
    ----     ---      --- ----    ----      ---------    ------------   ----    ----  ------ ------------     ----     
    ****     ****    **** ************      ****  ****   ****  ******   ****    ****    **** ****    ****     ****     
    ----      ----------  ------------      ----   ----  ----   ----- --------  ------------ ----    ----     ----     
    ****       ********   ************      ****    **** ****    **** ********  ************ ****    ****     ****     
    "
       for($i = 1; $i -le 8; $i++ ) {
        sleepTimerM 500
        write ""
    }


    writeFastScroll "The ruler of these lands, the mighty king, declares to you in calm, powerful voice, your orders....`n`n"
    sleepTimerS 1
    writeFastScroll '"This Kingdom used to peaceful. Now,'
    sleepTimerS 1
    writeFastScroll  ' its a wreck."'
    sleepTimerS 1
    writeFastScroll `n'"Our forces are already spread too thin, this cannot last"'
    sleepTimerS 1
    writeFastScroll `n'"Our great defender, Blargh, the most powerful knight this land has ever known, has gone missing"'
    sleepTimerS 2
    writeFastScroll `n'"Find him, o brave knight. You must find Blargh, and see that he returns to the kingdom"'
    sleepTimerS 2
    writeFastScroll `n'"And you must do it quickly...."'
    sleepTimerS 2
    writeFastScroll `n'"Or else I fear...."'
    sleepTimerS 2
    writeFastScroll `n'"There may not be a kingdom much longer"'
#>
    Read-Host "Begin Your Journey? (Y/N)"
        if (Read-Host -eq "Y") {

        } 
}

function journeyStart {
    write "The journey has begun"
}












intro





