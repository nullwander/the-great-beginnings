#The purpose of this script is to learn Powershell, and to learn Directory Manipulation through Powershell. 

# This function checks to see if the directory and file for the dump log exists. If it does not, it makes one.
function FileCheck {
    param (
        [string]$directorypath
    )
    $user = $env:USERNAME
    $directorypath = "C:\Users\$user\Desktop\Test"
    $filepath = "$directorypath\dump.log"
    $directorycondition = Test-Path -Path $directorypath
    $filecondition = Test-Path -Path $filepath

    if ( $directorycondition ) {
        Write-Host "Directory Exists: $directorypath" -ForegroundColor Green
        Start-Sleep -Seconds 2
    } else {
        Write-Host "Directory does not exist. Making now! :)" -ForegroundColor Red
        Start-Sleep -Seconds 2
        New-Item -ItemType Directory -Path $directorypath | Out-Null
    }

    if ( $filecondition ) {
        Write-Host "File Exists: $filepath" -ForegroundColor Green
        Write-Host "End of FileCheck Script." 
    } else {
        Write-Host "File does not exist. Making now! :)" -ForegroundColor Red
        Start-Sleep -Seconds 2
        New-Item -ItemType File -Path $filepath | Out-Null
        Write-Host "End of FileCheck Script." -ForegroundColor Red
    } 
}
