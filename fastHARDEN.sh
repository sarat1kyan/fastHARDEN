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

#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Function to check if a command is available
is_command_available() {
    type -P $1 >/dev/null 2>&1
    return $?
}

# Function to enable and start a service
enable_and_start_service() {
    service=$1
    systemctl enable --quiet $service
    systemctl start --quiet $service
}

# Function to allow a port in UFW
allow_port_in_ufw() {
    port=$1
    ufw allow $port >/dev/null 2>&1
}

# Function to restrict root access
restrict_root_access() {
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
    service ssh restart
}

# Function to secure sensitive system files
secure_sensitive_files() {
    chmod 600 /etc/shadow
    chmod 600 /etc/gshadow
    chmod 644 /etc/passwd
    chmod 644 /etc/group
    chmod 640 /etc/sudoers
    chmod 600 /etc/ssh/ssh_host_*key*
    chmod 600 /root/.ssh/authorized_keys
    chmod 700 /root
    chmod 700 /var/log
}

# Function to configure network intrusion detection
configure_network_intrusion_detection() {
    apt install snort -y
    echo "alert icmp any any -> \$HOME_NET any (msg:\"ICMP traffic detected\"; sid:10000001;)" > /etc/snort/rules/local.rules
    systemctl enable snort
    systemctl start snort
}

# Function to set up log monitoring
set_up_log_monitoring() {
    apt install logwatch -y
    cp /usr/share/logwatch/default.conf/logwatch.conf /etc/logwatch/conf/logwatch.conf
    echo "MailTo = your_email@example.com" >> /etc/logwatch/conf/logwatch.conf
}

# Function to secure the /tmp directory
secure_tmp_directory() {
    sed -i 's/\/tmp[[:space:]]/\/tmp[[:space:]]\/tmpfs[[:space:]]defaults,nodev,nosuid,noexec[[:space:]]0[[:space:]]0/' /etc/fstab
    mount -o remount /tmp
}

# Function to configure system logging
configure_system_logging() {
    apt install auditd -y
    systemctl enable auditd
    systemctl start auditd
}

# Function to configure network security
configure_network_security() {
    systemctl disable avahi-daemon
    systemctl disable cups
    ufw allow 80/tcp
    ufw allow 443/tcp
    ufw allow 53/udp
    ufw allow 123/udp
    ufw --force enable
    echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf
    echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
    echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.conf
    echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
    echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf
    echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
    echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
    sysctl -p
}

# Function to enforce password policies
enforce_password_policies() {
    apt install libpam-pwquality -y
    echo "password requisite pam_pwquality.so retry=3" >> /etc/pam.d/common-password
    echo "password requisite pam_pwquality.so minlen=12" >> /etc/pam.d/common-password
    echo "password requisite pam_pwquality.so ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1" >> /etc/pam.d/common-password
    echo "password requisite pam_pwquality.so minclass=3" >> /etc/pam.d/common-password
}

# Function to harden SSH configuration
harden_ssh() {
    echo "Protocol 2" >> /etc/ssh/sshd_config
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
    echo "AllowUsers your_username" >> /etc/ssh/sshd_config
    service ssh restart
}

# Function to restrict access to system binaries
restrict_access_to_binaries() {
    chmod 750 /bin/*
    chmod 750 /usr/bin/*
    chmod 750 /sbin/*
    chmod 750 /usr/sbin/*
}

# Function to implement process monitoring
implement_process_monitoring() {
    apt install psacct -y
    systemctl enable psacct
    systemctl start psacct
}

# Function to disable unnecessary services
disable_unnecessary_services() {
    systemctl disable bluetooth
    systemctl disable cups
    systemctl disable cups-browsed
    systemctl disable avahi-daemon
    systemctl disable avahi-daemon.socket
}

# Function to configure kernel parameters
configure_kernel_parameters() {
    echo "kernel.exec-shield = 1" >> /etc/sysctl.conf
    echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
    echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
    sysctl -p
}

# Function to enforce strong user authentication
enforce_strong_user_authentication() {
    echo "auth required pam_tally2.so deny=5 unlock_time=900" >> /etc/pam.d/common-auth
    echo "auth required pam_unix.so nullok_secure use_first_pass" >> /etc/pam.d/common-auth
    echo "auth required pam_tally2.so onerr=succeed file=/var/log/tallylog" >> /etc/pam.d/common-account
}

# Apply all security measures
apply_all_security_measures() {
    restrict_root_access
    secure_sensitive_files
    configure_network_intrusion_detection
    set_up_log_monitoring
    secure_tmp_directory
    configure_system_logging
    configure_network_security
    enforce_password_policies
    harden_ssh
    restrict_access_to_binaries
    implement_process_monitoring
    disable_unnecessary_services
    configure_kernel_parameters
    enforce_strong_user_authentication
}

# Apply security measures
apply_all_security_measures

# Notify user that the script has completed
echo "System hardening completed."
