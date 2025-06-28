The purpose of this script is to get familiar with networking in bash automation. 

I learned a few things with this, including:
- The use of awk as a text-based language, allowing for easier parsing and outputs
- The use of combining common commands like ip route and awk to get the user's active subnet automatically.
- Trying and debugging nmap scans that automatically happen, but sometimes fail to work properly. 

How to use:
- Note: These instructions account for if the user chooses to change the name or location of the script.
- Download the repo using git clone, or manually. 
- Once downloaded, open a terminal and use "chmod +x <script location>" to make it executable. 
- In the same terminal, use "./<script_name>" to run the script.
- This script will create a directory in your desktop called /pb/ if it doesn't exist following user prompt. 
- Then, it will check if it's log file already exists. If not, following user prompt, it creates it.

Any and all updates or recommendations welcome, please do not hesitate to reach out. 

I'm mostly using these for learning, so please keep complexity in mind. 
