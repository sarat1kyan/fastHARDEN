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

# Determine the package manager
if [ -x "$(command -v apt)" ]; then
    package_manager="apt"
    install_cmd="apt install"
    ufw_cmd="ufw"
    ufw_service="ufw"
    auditd_service="auditd"
    auditd_cmd="auditd"
elif [ -x "$(command -v yum)" ]; then
    package_manager="yum"
    install_cmd="yum install"
    ufw_cmd="firewalld"
    ufw_service="firewalld"
    auditd_service="auditd"
    auditd_cmd="auditd"
else
    echo "Unsupported package manager. Exiting..."
    exit 1
fi

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Update the system
echo "Updating system..."
if [ "$package_manager" = "apt" ]; then
    apt update
    apt upgrade -y
elif [ "$package_manager" = "yum" ]; then
    yum update -y
fi
echo "System update complete."

# Install essential security tools
echo "Installing security tools..."
$install_cmd $ufw_cmd fail2ban rkhunter -y
echo "Security tools installed."

# Enable the firewall
echo "Setting up firewall..."
if [ "$package_manager" = "apt" ]; then
    $ufw_cmd default deny incoming
    $ufw_cmd default allow outgoing
    $ufw_cmd allow ssh
    $ufw_cmd enable
elif [ "$package_manager" = "yum" ]; then
    systemctl enable $ufw_service
    systemctl start $ufw_service
    firewall-cmd --zone=public --add-service=ssh --permanent
    firewall-cmd --reload
fi
echo "Firewall setup complete."

# Secure SSH
echo "Securing SSH..."
sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
service ssh restart
echo "SSH secured."

# Harden sysctl settings
echo "Harden sysctl settings..."
echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf
sysctl -p
echo "Sysctl settings hardened."

# Secure shared memory
echo "Securing shared memory..."
echo "none /run/shm tmpfs rw,noexec,nosuid,nodev 0 0" >> /etc/fstab
mount -o remount /run/shm
echo "Shared memory secured."

# Disable core dumps
echo "Disabling core dumps..."
echo "* hard core 0" >> /etc/security/limits.conf
echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
sysctl -p
echo "Core dumps disabled."

# Set password policy
echo "Setting password policy..."
$install_cmd libpam-pwquality -y
sed -i 's/# minlen = 8/minlen = 12/' /etc/security/pwquality.conf
sed -i 's/password requisite pam_pwquality.so retry=3/password requisite pam_pwquality.so retry=3 minlen=12 minclass=3 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/common-password
echo "Password policy set."

# Enable auditd for system auditing
echo "Enabling auditd..."
$install_cmd $auditd_cmd -y
systemctl enable $auditd_service
systemctl start $auditd_service
echo "Auditd enabled."

# Configure log monitoring (using rsyslog)
echo "Configuring log monitoring..."
$install_cmd rsyslog -y
echo "# Log authpriv messages to a separate file
authpriv.* /var/log/auth.log
# Log sudo commands
if \$programname == 'sudo' then /var/log/sudo.log
# Log SSH activity
if \$programname == 'sshd' then /var/log/ssh.log" > /etc/rsyslog.d/10-custom.conf
systemctl restart rsyslog
echo "Log monitoring configured."

# Enable automatic updates for security packages
echo "Enabling automatic updates..."
echo "APT::Periodic::Update-Package-Lists \"1\";
APT::Periodic::Unattended-Upgrade \"1\";" >> /etc/apt/apt.conf.d/20auto-upgrades
echo "Automatic updates enabled."

# Monitor file changes (using inotify)
echo "Setting up file integrity monitoring..."
$install_cmd inotify-tools -y
echo "#!/bin/bash
inotifywait -m -r -e modify,create,delete,attrib,close_write /etc /bin /usr/bin /sbin /usr/sbin |
while read path action file; do
    echo \"\$path\$file has been \$(echo \$action | sed 's/CREATE/created/;s/DELETE/deleted/;s/MODIFY/modified/;s/ATTRIB/modified/;s/CLOSE_WRITE/modified/')\"
done" > /usr/local/bin/file-monitor.sh
chmod +x /usr/local/bin/file-monitor.sh
echo "File integrity monitoring script created."

# Harden network parameters
echo "Harden network parameters..."
echo "net.ipv4.conf.default.rp_filter=1
net.ipv4.conf.all.rp_filter=1
net.ipv4.icmp_echo_ignore_broadcasts=1
net.ipv4.icmp_ignore_bogus_error_responses=1
net.ipv4.conf.all.accept_source_route=0
net.ipv6.conf.default.accept_source_route=0
net.ipv6.conf.all.accept_source_route=0
net.ipv4.conf.default.accept_redirects=0
net.ipv4.conf.all.accept_redirects=0
net.ipv6.conf.default.accept_redirects=0
net.ipv6.conf.all.accept_redirects=0
net.ipv4.conf.default.secure_redirects=0
net.ipv4.conf.all.secure_redirects=0" >> /etc/sysctl.conf
sysctl -p
echo "Network parameters hardened."

# Disable USB storage
echo "Disabling USB storage..."
echo "install usb-storage /bin/false" > /etc/modprobe.d/disable-usb-storage.conf
echo "USB storage disabled."

# Enable system process accounting
echo "Enabling process accounting..."
$install_cmd acct -y
systemctl enable acct
systemctl start acct
echo "Process accounting enabled."

# Set restricted permissions on key system binaries
echo "Setting restricted permissions on key system binaries..."
chmod 700 /usr/bin/wall
chmod 700 /usr/bin/whereis
chmod 700 /usr/bin/who
chmod 700 /usr/bin/whoami
chmod 700 /usr/bin/locate
echo "Restricted permissions set on key system binaries."

# Secure cron jobs
echo "Securing cron jobs..."
chown root:root /etc/crontab
chmod og-rwx /etc/crontab
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d
echo "Cron jobs secured."

# Disable system accounts
echo "Disabling system accounts..."
passwd -l games
passwd -l ftp
passwd -l irc
passwd -l news
passwd -l uucp
echo "System accounts disabled."

# Disable unnecessary services
echo "Disabling unnecessary services..."
if [ "$package_manager" = "apt" ]; then
    $install_cmd sysv-rc-conf -y
    sysv-rc-conf --level 2-5 apache2 off  # Example: Disabling Apache (adjust as needed)
    sysv-rc-conf --level 2-5 smbd off    # Example: Disabling Samba (adjust as needed)
    # Add more services to disable
elif [ "$package_manager" = "yum" ]; then
    systemctl disable apache2     # Example: Disabling Apache (adjust as needed)
    systemctl stop apache2
    systemctl disable smbd       # Example: Disabling Samba (adjust as needed)
    systemctl stop smbd
    # Add more services to disable
fi
echo "Unnecessary services disabled."

# Improve filesystem security
echo "Improving filesystem security..."
chmod 700 /var/log/*  # Restrict access to log files
chmod 700 /var/log
chown root:adm /var/log
chmod 700 /var/adm
chown root:adm /var/adm
echo "Filesystem security improved."

echo "System hardening complete."
