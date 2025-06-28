Hello,

This is the first script I've made with bash. Originally, it was just a normal file-checking script, and if the file didn't exist the program would create it.

After that got working and made a solid foundation, the next step was to check for the directory, and do the same. 

Once those were completed, I had a basic read/write script that checks for my $output_file. 

This morning, I expanded the idea into a forensic logging tool. I added:
- `lsusb` output (currently connected USB devices)
- `journalctl` filtering (historical USB events from the system log)

Both are appended into a date-named output file for auditing purposes.

## Why I made this:

- I'm using this project to learn not only bash, but linux's system internals. Mainly how devices interact, and how shell interacts, and how they can be logged/monitored for basic forensic use. This started as a muscle memory excersize and turned into a fun basic usable USB logging tool.

## How to use:

download repository (using either git clone, or manually)
#check if bash is installed using 'bash --version', if bash is not found, or is not working, please install or repair to run this file.

chmod +x usb_forensic_script.sh
#This will make it executable. 

./usb_forensic_script.sh
#This runs the file after turning it into an executable.
#Reminder!! This file will create a new directory on your desktop, with the log file inside of it. It has no for, while, or any looping, so it will only make the one file. 


