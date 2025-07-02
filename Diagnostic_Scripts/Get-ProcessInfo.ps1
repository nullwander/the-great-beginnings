#Process Diagnostics.
$output = @()
$output += "=== Process Info: $(Get-Date) ==="

$output += (Get-Process | Group-Object Name | ForEach-Object {  #Grabs processes
    [PSCustomObject]@{
        Name = $_.Name
        TotalCPU = ($_.Group | Measure-Object CPU -Sum).Sum
        TotalMemoryMB = [math]::Round(($_.Group | Measure-Object WorkingSet -Sum).Sum / 1MB, 2)
        Count = $_.Count
    } # this block takes the objects from Get-Process, calcs their sum for the groups on both CPU and Memory in MB, then counts to organize. 
} | Sort-Object TotalCPU -Descending | Select-Object -First 5 ) # Sorts for more readability. Appends to file. 

$output += "=== End of Process Info ===" 
return $output
