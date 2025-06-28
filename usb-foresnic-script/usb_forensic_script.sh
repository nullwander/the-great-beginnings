#!/bin/bash

output_file="$HOME/Desktop/pb/Script_output_$(date +%F).log"

echo "[!] This task will automatically create an output file at $HOME/Desktop/pb/ [!]" 
echo -e "[!] To exit hit CTRL+C [!]" 
sleep 5

echo "Checking for the directory."
sleep 1
if [[ -d "$HOME/Desktop/pb/" ]]; then
    echo "[+] Directory Found. [+]" && sleep 1
else
    echo "[-] Directory Not Found. [-]" && sleep 1 && echo "Making directory." && sleep 1 && mkdir -p "$HOME/Desktop/pb/"
fi

echo "Checking for the file."
sleep 1
if [[ ! -f "$output_file" ]]; then
    echo "[!] File Not Found! [!]" && echo -e "[!] Log created. [!]" && touch "$output_file"
else
    echo "[!] File Found! [!]" && echo -e "[~] Using this file to write. [~]" 
fi 

if [[ -f "$output_file" ]]; then
    echo "[!] Logging USB output using this file. $(date +%F) [!]" | tee -a $output_file
    echo -e "\n[+] Currently Connected USB Devices (lsusb):\n" | tee -a "$output_file"
    lsusb | tee -a "$output_file"
    echo -e "\n[+] Historical USB Events (from journalctl):\n" | tee -a "$output_file"
    journalctl --dmesg --grep="usb" --no-pager | tee -a "$output_file"
fi



