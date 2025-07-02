# This file is for sorting and printing the output of the rest of the reports and checks, and neatly puts them into a readable format for T2 Help-desk. 

$logBuffer = @()
#doing the file check
. C:\Users\$env:USERNAME\Desktop\projects\Diagnostic_Scripts\FileCheck.ps1
FileCheck
#beginning of script
"=== Beginning of the Diagnostic ===`n" | Out-String | Out-File -FilePath "C:\Users\$env:USERNAME\Desktop\Test\dump.log"
#appending
$logBuffer += . "C:\Users\$env:USERNAME\Desktop\projects\Diagnostic_Scripts\Get-EventInfo.ps1"
$logBuffer += . "C:\Users\$env:USERNAME\Desktop\projects\Diagnostic_Scripts\Get-NetworkInfo.ps1"
$logBuffer += . "C:\Users\$env:USERNAME\Desktop\projects\Diagnostic_Scripts\Get-ProcessInfo.ps1"

#final write
$logPath = "C:\Users\$env:USERNAME\Desktop\Test\dump.log"
$logBuffer | Out-File -FilePath $logPath -Encoding UTF8

Write-Host "Diagnostic Report dumped to $logPath" -ForegroundColor Cyan
