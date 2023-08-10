      █████▒▄▄▄        ██████ ▄▄▄█████▓ ██░ ██  ▄▄▄       ██▀███  ▓█████▄ ▓█████  ███▄    █ 
    ▓██   ▒▒████▄    ▒██    ▒ ▓  ██▒ ▓▒▓██░ ██▒▒████▄    ▓██ ▒ ██▒▒██▀ ██▌▓█   ▀  ██ ▀█   █ 
    ▒████ ░▒██  ▀█▄  ░ ▓██▄   ▒ ▓██░ ▒░▒██▀▀██░▒██  ▀█▄  ▓██ ░▄█ ▒░██   █▌▒███   ▓██  ▀█ ██▒
    ░▓█▒  ░░██▄▄▄▄██   ▒   ██▒░ ▓██▓ ░ ░▓█ ░██ ░██▄▄▄▄██ ▒██▀▀█▄  ░▓█▄   ▌▒▓█  ▄ ▓██▒  ▐▌██▒
    ░▒█░    ▓█   ▓██▒▒██████▒▒  ▒██▒ ░ ░▓█▒░██▓ ▓█   ▓██▒░██▓ ▒██▒░▒████▓ ░▒████▒▒██░   ▓██░
     ▒ ░    ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ▒ ░░    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▒▓  ▒ ░░ ▒░ ░░ ▒░   ▒ ▒ 
     ░       ▒   ▒▒ ░░ ░▒  ░ ░    ░     ▒ ░▒░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ▒  ▒  ░ ░  ░░ ░░   ░ ▒░
     ░ ░     ░   ▒   ░  ░  ░    ░       ░  ░░ ░  ░   ▒     ░░   ░  ░ ░  ░    ░      ░   ░ ░ 
                 ░  ░      ░            ░  ░  ░      ░  ░   ░        ░       ░  ░         ░ 
                                                                     ░                        
                                                               

# fastHARDEN

            THIS SCRIPT WAS IN TESTING DO NOT USE IT ON PRODUCTION SERVERS

The script is designed to enforce security measures by high-lvl hardening at first response, when everything f*cked up

Monitoring running services, open ports, and preventing new services from starting. It also closes all other ports and applies restrictions on user creation, user privilege changes, and kernel file modifications. The prevention measures remain in effect until you stop the script with Ctrl+C.

    Here's a breakdown of the script's functionality:

The script checks for available firewall packages such as ufw, firewall-cmd, or iptables and determines which one is present.

It defines functions to check if a service is running, if a command is available, and to disable user creation, privilege changes, and kernel file modifications.

The script guides you with an explanation of its purpose and prompts you to enter the ports you want to open. To finish entering ports, you can enter 'd'. It also informs you to press Ctrl+C to stop the script.

Inside the main loop, the script executes the following steps:

Disables new services by masking them, preventing them from starting.
Disables user creation if it hasn't already been disabled.
Disables privilege changes if they haven't already been disabled.
Disables kernel file modifications if they haven't already been disabled.
Disables new cron tasks by removing the user's crontab.
Closes all other ports by resetting the firewall rules or removing non-allowed ports, depending on the firewall package.
Allows specified ports by invoking the appropriate firewall command for the chosen package.
The script then displays the list of running services and their status, as well as the list of open ports and their status.

After a 5-second sleep, the loop repeats, ensuring continuous monitoring and enforcement of security measures.

    You can run this script in a Linux environment to maintain strict control over running services, open ports, user creation, privilege changes, and kernel file modifications until you decide to stop it.

    Please note that this script assumes root privileges for executing certain commands and modifying system files. Exercise caution and ensure you understand the implications before running the script.
