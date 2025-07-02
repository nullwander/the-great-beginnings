# This one gets network info.

$output = @()
$output += "=== Network Diagnostics: $(Get-Date) ==="

$NetworkLog = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {
    $_.IPv4Address -notmatch '^169\.254\.' -and $_.IPAddress -notmatch '^127\.'
} | Select-Object IPAddress, InterfaceAlias)


$output += foreach ($entry in $NetworkLog) {
    "Interface: $($entry.InterfaceAlias)" 
    "IP Address: $($entry.IPAddress)" 
    "Prefix Length: $($entry.PrefixLength)" 
    "`n"
}

$output += "=== End of Network Diagnostics ==="
return $output