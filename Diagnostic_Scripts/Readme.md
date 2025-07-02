# PowerShell Diagnostic Toolkit

A lightweight PowerShell toolkit for collecting quick diagnostic snapshots of Windows systems. Designed to support Help Desk and Tier 2 escalation workflows.

## Features

-  System process usage (CPU, RAM)
-  Recent critical and error Event Logs
-  Network configuration snapshot
-  Modular, easy-to-extend design
-  Minimal output for fast triage

## Getting Started

1. Clone the repo or download it manually
2. Run `DiagnosticMain.ps1` as a standard user or admin
3. Log file will be created on your Desktop at:  
   `C:\Users\<yourname>\Desktop\Test\dump.log`

## File Descriptions

- `DiagnosticMain.ps1`: Orchestrates the entire toolkit
- `FileCheck.ps1`: Ensures log output path and file exist
- `Get-EventInfo.ps1`: Pulls last 5 critical/error Event Viewer entries
- `Get-ProcessInfo.ps1`: Top 5 CPU/memory usage processes
- `Get-NetworkInfo.ps1`: Active IPv4 interface information

Note: If any fields are left blank - like PrefixLength in Network Info - it is due to there not being any information. I am working on another version of this that will not only fix that issue, but also include DNS checks for stable network connectivity checks. 
