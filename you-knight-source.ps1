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
#function for creating fast scrolling read host text
function readFastScroll {
    param($Text)
    ForEach ($Character in $Text.ToCharArray()) {
        Read-Host -NoNewLine  $Character
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
}

function startGame {
    $playerAnswer1 = Read-Host -Prompt "Will you take on this task? (Y / N)" 
    if ($playerAnswer1 -eq "Y" -or $playerAnswer1 -eq "y") {
        writeFastScroll "Good luck, and safe travels, o brave one"
        sleepTimerS 3
        Clear-Host
        part1
    } elseif ($playerAnswer1 -eq "N" -or $playerAnswer1 -eq "n") {
        writeFastScroll "The journey, im afraid, is not optional. STEEL YOURSELF, AND SET OUT!!`nLEST YOU WISH FOR A FOOT IN THE ASS!!"
        sleepTimerS 3
        Clear-Host
        part1
    } else {
        writeFastScroll "Listen again to what I ask..."
        sleepTimerS 1
        Clear-Host
        startGame
    }
}

function part1 {
    writeFastScroll "You stop by your quarters to gather you things before heading out`n"
    sleepTimerS 1
    writeFastScroll "As an aspiring young knight, you are no stranger to combat. Before embarking on your journey to locate Blargh, you must arm yourself on your journey`n"
    sleepTimerS 1
    function weaponChoice1 {
        writeFastScroll "Which weapon will you choose?"
        sleepTimerS 1
        readFastScroll "SWORD(1) ----- WAND(2) ----- FIST(3)"
        if (readFastScroll -eq 1) {

        } elseif (readFastScroll -eq 2) {

        } elseif (readFastScroll -eq 3) {

        } else {
            
        }
    }
}




startGame









