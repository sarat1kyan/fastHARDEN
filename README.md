        ______                       __      __    __   ______   _______   _______   ________  __    __ 
       /      \                     /  |    /  |  /  | /      \ /       \ /       \ /        |/  \  /  |
      /$$$$$$  |______    _______  _$$ |_   $$ |  $$ |/$$$$$$  |$$$$$$$  |$$$$$$$  |$$$$$$$$/ $$  \ $$ |
      $$ |_ $$//      \  /       |/ $$   |  $$ |__$$ |$$ |__$$ |$$ |__$$ |$$ |  $$ |$$ |__    $$$  \$$ |
      $$   |   $$$$$$  |/$$$$$$$/ $$$$$$/   $$    $$ |$$    $$ |$$    $$< $$ |  $$ |$$    |   $$$$  $$ |
      $$$$/    /    $$ |$$      \   $$ | __ $$$$$$$$ |$$$$$$$$ |$$$$$$$  |$$ |  $$ |$$$$$/    $$ $$ $$ |
      $$ |    /$$$$$$$ | $$$$$$  |  $$ |/  |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |__$$ |$$ |_____ $$ |$$$$ |
      $$ |    $$    $$ |/     $$/   $$  $$/ $$ |  $$ |$$ |  $$ |$$ |  $$ |$$    $$/ $$       |$$ | $$$ |
      $$/      $$$$$$$/ $$$$$$$/     $$$$/  $$/   $$/ $$/   $$/ $$/   $$/ $$$$$$$/  $$$$$$$$/ $$/   $$/ 
                                                                                                        
                                                               

# fastHARDEN

      System Hardening Script fastHARDEN - WARNING: USE AT YOUR OWN RISK

This script is designed to enhance the security of your Linux-based system by implementing a set of security measures and best practices. It is intended for users who suspect that their system may be compromised or wish to proactively safeguard their system against potential threats. The script applies a series of configurations and settings to minimize vulnerabilities and strengthen the overall security posture of the system.

      WARNING: Use this script with caution, and only on systems you fully understand and own. It may modify critical system settings and services, which could lead to system instability or unintended consequences.

Use Case:

* You believe your system may have been compromised or could be targeted soon.
* You want to fortify your system against various common attack vectors.
* You are knowledgeable about Linux system administration and understand the implications of the changes this script makes.
* What the Script Does:

* Updates the System: It ensures that the system is up-to-date by applying the latest security patches.
* Installs Security Tools: Essential security tools, including a firewall (UFW or firewalld), fail2ban (intrusion prevention), and rkhunter (rootkit scanner) are installed.
* Configures Firewall: The script sets up firewall rules to allow necessary traffic (e.g., SSH) while blocking unauthorized incoming connections.
* Secures SSH: SSH configuration is hardened by disabling root login and password authentication, improving the security of remote access.
* Harden Sysctl Settings: Network and kernel parameters are adjusted to prevent certain types of attacks.
* Secure Shared Memory: Shared memory is configured with more restrictive permissions.
* Disable Core Dumps: Disables core dumps, which can be exploited in some attacks.
* Set Password Policy: Strengthens password policies for users.
* Enable Auditd: Enables system auditing for tracking system activities.
* Configure Log Monitoring: Sets up log monitoring for specific events, enhancing system visibility.
* Enable Automatic Updates: Enables automatic updates for security-related packages.
* Monitor File Changes: Sets up file integrity monitoring to detect modifications to critical system files.
* Harden Network Parameters: Further secures network-related settings.
* Disable USB Storage: Prevents the loading of USB storage modules.
* Enable System Process Accounting: Enables process accounting for tracking system processes.
* Set Restricted Permissions: Sets restricted permissions on key system binaries.
* Secure Cron Jobs: Applies secure permissions to cron directories and files.
* Disable System Accounts: Disables certain unnecessary system accounts.
* Disable Unused Network Protocols: Prevents the loading of unused network protocols.

      IMPORTANT:

Carefully review the script, understand each step, and ensure it aligns with your needs and system configuration.
Backup: Always back up your system before running this script to mitigate the risk of data loss or system instability.
Test: Test the script in a non-production environment to verify compatibility and functionality.
Regular Monitoring: Continuously monitor your system after applying these changes to detect any unexpected issues or threats.
Stay Updated: Regularly update your system and security tools to stay protected against emerging threats.

      p.s. if there is any problem while running just remove the banner part ;)
