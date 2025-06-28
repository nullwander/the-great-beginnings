#!/bin/bash

output_file="$HOME/Desktop/pb/system-ping-info_$(date +%F).log"


if [[ -d "$HOME/Desktop/pb" ]]; then
    echo "Using ~/Desktop/pb"
else
    echo "Directory not found."
    read -p "Press Enter to create directory."
    mkdir -p "$HOME/Desktop/pb" && echo "Directory created."
    sleep 1
fi

echo "Checking for file..."
sleep 1
if [[ ! -f "$output_file" ]]; then
    echo "File not found!"
    read -p "Press Enter to create file."
    touch "$output_file" && echo "File created."
    sleep 1
else
    echo "File found at $output_file"
    sleep 1
fi

echo "This program will use the file at $output_file"
sleep 1
echo -e "\n[$(date '+%F %T')] Running network scan on $active_subnet" | tee -a "$output_file"

# Run pings
active_subnet="$(ip route | grep 'src' | awk '$1 != "default" {print $1; exit}')"
echo "[ $(date '+%F %T') ] Running network scan on $active_subnet" | tee -a "$output_file"
nmap -sn "$active_subnet" | awk '/Nmap scan report/ {ip = $NF} /Host is up/ {print ip}' | tee -a "$output_file"