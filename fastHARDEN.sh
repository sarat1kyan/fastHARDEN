#!/bin/bash

echo "////////////////"

banner1() {
  local text="$@"
  local length=$(( ${#text} + 2 ))
  local line=$(printf '%*s' "$length" '' | tr ' ' '-')
  echo "+$line+"
  printf "| %s |\n" "$(date)"
  echo "+$line+"
  printf "|$bold%s$reset|\n" "$text"
  echo "+$line+"
}


#clolors
white='\e[1;37m'
green='\e[0;32m'
blue='\e[1;34m'
red='\e[1;31m'
yellow='\e[1;33m' 
echo ""
echo ""
banner() {
	echo -e $'\e[1;33m\e[0m\e[1;37m        █████▒▄▄▄        ██████ ▄▄▄█████▓ ██░ ██  ▄▄▄       ██▀███  ▓█████▄ ▓█████  ███▄    █     \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m      ▓██   ▒▒████▄    ▒██    ▒ ▓  ██▒ ▓▒▓██░ ██▒▒████▄    ▓██ ▒ ██▒▒██▀ ██▌▓█   ▀  ██ ▀█   █      \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m      ▒████ ░▒██  ▀█▄  ░ ▓██▄   ▒ ▓██░ ▒░▒██▀▀██░▒██  ▀█▄  ▓██ ░▄█ ▒░██   █▌▒███   ▓██  ▀█ ██▒     \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m      ░▓█▒  ░░██▄▄▄▄██   ▒   ██▒░ ▓██▓ ░ ░▓█ ░██ ░██▄▄▄▄██ ▒██▀▀█▄  ░▓█▄   ▌▒▓█  ▄ ▓██▒  ▐▌██▒     \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m      ░▒█░    ▓█   ▓██▒▒██████▒▒  ▒██▒ ░ ░▓█▒░██▓ ▓█   ▓██▒░██▓ ▒██▒░▒████▓ ░▒████▒▒██░   ▓██░     \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m       ▒ ░    ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░  ▒ ░░    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▒▓  ▒ ░░ ▒░ ░░ ▒░   ▒ ▒      \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m       ░       ▒   ▒▒ ░░ ░▒  ░ ░    ░     ▒ ░▒░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ▒  ▒  ░ ░  ░░ ░░   ░ ▒░     \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m       ░ ░     ░   ▒   ░  ░  ░    ░       ░  ░░ ░  ░   ▒     ░░   ░  ░ ░  ░    ░      ░   ░ ░      \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m                   ░  ░      ░            ░  ░  ░      ░  ░   ░        ░       ░  ░         ░      \e[0m'
	echo -e $'\e[1;33m\e[0m\e[1;37m                     ░       ░        ░   ░  ░  ░     \e[0m'
	
	echo ""    
	echo -e $'\e[1;33m\e[0m\e[1;33m    ██████████\e[0m'"\e[96m██████████"'\e[1;33m\e[0m\e[1;31m██████████\e[0m' '\e[1;32m\e[0m\e[1;32m enforce security measures by fast high-lvl hardening \e[0m''\e[1;37m\e[0m\e[1;37m \e[0m'                                       
	echo ""
	echo -e $'\e[1;33m\e[0m\e[1;33m  [ \e[0m\e[1;32m Follow on Github :- https://github.com/54R4T1KY4N \e[0m \e[1;32m\e[0m\e[1;33m] \e[0m'
	echo ""
	echo -e $'\e[1;37m\e[0m\e[1;37m    +-+-+-+-+-+-+-+ >>\e[0m'
	echo -e "\e[93m    fastHARDEN |1|.|3| stable"      
	echo -e $'\e[1;37m\e[0m\e[1;37m    +-+-+-+-+-+-+-+ >>\e[0m' 
	echo ""                                                
}
banner 

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   banner1 "This script must be run as root"
   exit 1
fi


# Function to check if a service is running
is_service_running() {
    service=$1
    systemctl is-active --quiet $service
    return $?
}

# Function to check if a command is available
is_command_available() {
    command=$1
    type -P $command >/dev/null 2>&1
    return $?
}

# Function to disable user creation
disable_user_creation() {
    echo "auth required pam_succeed_if.so quiet_success user != root" >> /etc/pam.d/common-auth
    echo "auth required pam_succeed_if.so quiet_success user != root" >> /etc/pam.d/common-account
    echo "auth required pam_succeed_if.so quiet_success user != root" >> /etc/pam.d/common-password
    echo "auth required pam_succeed_if.so quiet_success user != root" >> /etc/pam.d/common-session
}

# Function to disable privilege changes
disable_privilege_changes() {
    chattr +i /etc/passwd
    chattr +i /etc/shadow
    chattr +i /etc/group
    chattr +i /etc/sudoers
}

# Function to disable kernel file modifications
disable_kernel_file_modifications() {
    chattr +i /boot/vmlinuz*
    chattr +i /boot/initrd.img*
}

# Function to check if user creation is disabled
is_user_creation_disabled() {
    grep -q "auth required pam_succeed_if.so quiet_success user != root" /etc/pam.d/common-auth
    return $?
}

# Function to check if privilege changes are disabled
is_privilege_changes_disabled() {
    lsattr -d /etc/passwd | grep -q "i"
    return $?
}

# Function to check if kernel file modifications are disabled
is_kernel_file_modifications_disabled() {
    lsattr -d /boot/vmlinuz* | grep -q "i"
    return $?
}

# Check available firewall packages
if is_command_available "ufw"; then
    firewall_cmd="ufw"
    firewall_reload_cmd="ufw reload"
    firewall_allow_cmd="ufw allow"
elif is_command_available "firewall-cmd"; then
    firewall_cmd="firewall-cmd"
    firewall_reload_cmd="firewall-cmd --reload"
    firewall_allow_cmd="firewall-cmd --add-port"
elif is_command_available "iptables"; then
    firewall_cmd="iptables"
    firewall_reload_cmd="iptables-save | sudo tee /etc/iptables/rules.v4"
    firewall_allow_cmd="iptables -A INPUT -p"
else
    echo "No supported firewall package found. Exiting..."
    exit 1
fi

# Function to allow a port in the firewall
allow_port() {
    port=$1
    protocol=$2
    inbound_outbound=$3
    zone=$4
    $firewall_allow_cmd=$port/$protocol --$inbound_outbound --zone=$zone >/dev/null 2>&1
}

# Get the list of currently running services
running_services=$(systemctl list-units --type=service --state=running --no-legend | awk '{print $1}')

# Guide for the user
echo "This script will monitor running services, open ports, and enforce security measures."
echo "It will prevent new services from starting, close all other ports, and apply security restrictions."
echo "You will be prompted to enter the ports you want to open."
echo "To finish entering ports, enter 'd'."
echo "Press Ctrl+C to stop the script."

# Variables for storing ports
declare -a ports_array

# Start the loop
while true; do
    # Disable new services
    for service in $running_services
    do
        systemctl mask --quiet --now $service
    done

    # Disable new user creation
    if ! is_user_creation_disabled; then
        disable_user_creation
    fi

    # Disable privilege changes
    if ! is_privilege_changes_disabled; then
        disable_privilege_changes
    fi

    # Disable kernel file modifications
    if ! is_kernel_file_modifications_disabled; then
        disable_kernel_file_modifications
    fi

    # Disable new cron tasks
    crontab -r

    # Close all other ports
    if [[ "$firewall_cmd" == "ufw" ]]; then
        ufw --force reset >/dev/null 2>&1
        ufw default deny incoming >/dev/null 2>&1
        ufw default deny outgoing >/dev/null 2>&1
        ufw --force enable >/dev/null 2>&1
    else
        for port in $(ss -nlt | awk 'NR > 1 {print $4}')
        do
            if ! [[ "${allowed_ports[@]}" =~ "${port}" ]]; then
                IFS='/' read -ra port_info <<< "$port"
                protocol="${port_info[1]}"
                port_number="${port_info[0]}"
                $firewall_cmd --zone=public --remove-port=$port_number/$protocol --permanent >/dev/null 2>&1
            fi
        done
        $firewall_reload_cmd
    fi

    # Allow specified ports
    for port_data in "${ports_array[@]}"
    do
        IFS='/' read -ra port_info <<< "$port_data"
        port_number="${port_info[0]}"
        protocol="${port_info[1]}"
        inbound_outbound="${port_info[2]}"
        zone="${port_info[3]}"
        allow_port $port_number $protocol $inbound_outbound $zone
    done

    clear
    echo "List of running services:"
    for service in $running_services
    do
        if is_service_running $service; then
            echo "$service is running"
        else
            echo "$service is not running"
        fi
    done

    echo "List of open ports:"
    for port in "${allowed_ports[@]}"
    do
        IFS='/' read -ra port_info <<< "$port"
        protocol="${port_info[1]}"
        port_number="${port_info[0]}"
        if is_command_available "ss"; then
            if ss -nlt | grep -q "$port_number.*$protocol"; then
                echo "$port is open"
            else
                echo "$port is closed"
            fi
        else
            if netstat -tuln | grep -q "$port_number.*$protocol"; then
                echo "$port is open"
            else
                echo "$port is closed"
            fi
        fi
    done

    sleep 5
done
