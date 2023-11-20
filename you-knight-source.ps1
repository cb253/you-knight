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

# Setting up the sleep timer function for message pacing
function sleepTimer {
    param($seconds)
    Start-Sleep -Seconds ($seconds)
}

# This is supposed to hide the file path and make things look a little prettier in the console, needs work
function prompt { 
    $p = Split-Path -leaf -path (Get-Location)  
    \"$p> \" 
}



Write-Host "This is a test message"
sleepTimer 4
Write-Host "This is a test message"
sleepTimer 2
Clear-Host