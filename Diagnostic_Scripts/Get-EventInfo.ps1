# This one gets network diagnostics and returns them for output. 

$output = @()
$output += "=== Event Diagnostics: $(Get-Date) ==="

$EVEvents = Get-WinEvent -FilterHashTable @{ # Fetching the last 10 Critical/Error events from EventViewer. 
    LogName='System'
    Level=1,2 # 1 = Critical , 2 = Error 
    StartTime=(Get-Date).AddDays(-1) # Limiting to the last 24 hours so I don't end up taking 10 years of log data. 
}


$output += $EVEvents | Sort-Object TimeCreated -Descending| Select-Object -First 5 TimeCreated, Id, LevelDisplayName, ProviderName, Message 
$output += "=== End of Event Diagnostics ==="
return $output
