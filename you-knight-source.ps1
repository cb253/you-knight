<#
.SYNOPSIS
A simple, text-based adventure game written in PowerShell
 
.DESCRIPTION
This script implements a short game using PowerShell. The game is a text-based adventure game set in the medival era. 
You play as an aspiring young knight, sent out by your king on an adventure to find Blargh, hero of the kingdom, who has mysteriously gone missing.

.NOTES
Author: Christian Belarde 
Version 1.0+
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
<#
function prompt { 
    $p = Split-Path -leaf -path (Get-Location)  
    \"$p> \" 
}
#>

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
function writeFastScrollE {
    param($Text)
    ForEach ($Character in $Text.ToCharArray()) {
        Write-Host -NoNewLine -ForegroundColor Red  $Character
        sleepTimerM 50
    }
}
#function for creating fast scrolling read host text
function readFastScroll {
    param($Text)
    ForEach ($Character in $Text.ToCharArray()) {
        Read-Host $Character
        sleepTimerM 50
    }
}


<#
function intro {
    write "   
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


    writeFastScroll "The ruler of these lands, the mighty king, declares to you in a calm and powerful voice, your orders....`n`n"
    sleepTimerS 1
    writeFastScroll '"This Kingdom used to be peaceful. Now,'
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

}

function startGame {
    $playerAnswer1 = Read-Host -Prompt "`nWill you take on this task? (Y / N)" 
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
    
    writeFastScroll "You stop by your quarters to gather your things before heading out`n"
    sleepTimerS 1
    writeFastScroll "As an aspiring young knight, you are no stranger to combat. Before embarking on your journey to locate Blargh, you must arm yourself!`n"
    sleepTimerS 1
    function weaponChoice1 {
        writeFastScroll "`nWhich weapon will you choose?`n"
        sleepTimerS 1
        writeFastScroll "SWORD(1) ----- WAND(2) ----- FIST(3"
        $weapon1 = Read-Host ")`n"
        if ($weapon1 -eq 1) {
            writeFastScroll "`nA fine choice for a knight, a fine choice indeed"
            sleepTimerS 1
            writeFastScroll "`nCrafted of the finest quality, and honed with a core meteorite. With this blade by your side, nothing will stand in your way!"
            sleepTimerS 1
            confirmWeaponChoice1
            $playerWeapon1 = "sword"
        } elseif ($weapon1 -eq 2) {
            writeFastScroll "`nYou are no mere knight, you are a mage!"
            sleepTimerS 1   
            writeFastScroll "`nThe wand practically vibrates with power. In the wrong hands, this could bring down an age of fire and destruction. Wield this carefully... "
            confirmWeaponChoice1
            $playerWeapon1 = "wand"
        } elseif ($weapon1 -eq 3) {
            writeFastScroll "`nA brute. A careful, calculating brute."
            sleepTimerS 1   
            writeFastScroll "`nIn times of old, quarrells of all sorts were settled with fisticuffs. Fists can be used for more than combat... they allow for a more, stealthy approach"
            confirmWeaponChoice1
            $playerWeapon1 = "fist"
        } else {
            writeFastScroll "`nPlease select a weapon"
            sleepTimerS 1
            Clear-Host
            weaponChoice1
        }

    }
    weaponChoice1
}
#>
function confirmWeaponChoice1 {
    sleepTimerS 1  
    writeFastScroll "`nHave you chosen your weapon? (Y / N)"
    $playerAnswer2 = Read-Host 
    if ($playerAnswer2 -eq "Y" -or $playerAnswer2 -eq "y") {
        writeFastScroll "`nAfter carefully selecting your weapon of choice, you decide its time to embark on your journey to find Blargh!"
        sleepTimerS 2
        Clear-Host
        encounter1
    } elseif ($playerAnswer2 -eq "N" -or $playerAnswer2 -eq "n") {
        weaponChoice1
    } else {
        writeFastScroll "`nListen again to what I ask..."
        sleepTimerS 1
        weaponChoice1
    }
}

function encounter1 {
    writeFastScroll "After leaving the kingdom, and with no direct leads to go off of, you decide to head to the place where people frequently go missing..."
    sleepTimerS 1
    writeFastScroll "`nThe Forest of Certain Death"
    sleepTimerS 1
    writeFastScroll "`n After walking north for some time, on the horizon you can see a vast, dark void that stretches seemingly forever in the each direciton"
    sleepTimerS 1
    writeFastScroll "`n The stench is overpowering from here. The void is made up of sickly looking trees of varying height, each growing in in strang direcitons"
    sleepTimerS 1
    writeFastScroll "`nThey look as if they are trying to escape from what lies within, The Forest of Ceratin Death" 
    sleepTimerS 1
    writeFastScroll "`n Press enter to continue"
        $continue = $true
            while ($continue) {
            $key = [System.Console]::ReadKey()
            if ($key.Key -eq "Enter") {
            $continue = $false
        }
    }
    Clear-Host
    writeFastScroll "`nBefore you finish you can finish you next step, a graveled, slimy voice calls out from your right"
    sleepTimerS 1
    writeFastScollE "`nHELLO THEEEEEERE"
    sleepTimerS 1
    writeFastScollE "`nI know what you're trying to do. You want to bring back this kingdoms brave little knight gone astray"
    sleepTimerM 500
    writeFastScollE "`nI"
    sleepTimerM 500
    writeFastScollE "`nWONT"
    sleepTimerM 500
    writeFastScollE "`nLET YOUUUU"
    sleepTimerS 1
    writeFastScroll "`nYou brace yourself and prepare for combat"
    writeFastScroll "`nPress enter to continue"
            $continue = $true
            while ($continue) {
            $key = [System.Console]::ReadKey()
            if ($key.Key -eq "Enter") {
            $continue = $false
        }
    }

}


intro
startGame
part1
encounter1







