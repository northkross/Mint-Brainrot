#!/bin/bash
# Please give around ~5 minutes for the raw to update
# Scorebot for 2024 Mint Brainrot
echo " "
echo " "
echo "NOTE: Please allow up to 5 minutes for scorebot updates & injects."
echo "Scorebot version: v1"
echo "Injects: NO"


# Function to check if text exists in a file
check_text_exists() {
    local file="$1"
    local text="$2"
    local vuln_name="$3"
    
    if grep -q "$text" "$file"; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}
check_text_exists2() {
    local file="$1"
    local text="$2"
    local text2="$3"
    local vuln_name="$4"
    
    if grep -q "$text" "$file" && grep -q "$text2" "$file"; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}
check_text_exists3() {
    local file="$1"
    local text="$2"
    local text2="$3"
    local text3="$4"
    local vuln_name="$5"
    
    if grep -q "$text" "$file" && grep -q "$text2" "$file" && grep -q "$text3" "$file"; then
        echo "Vulnerability fixed: '$vuln_name'"
        count=count+1
    else
        echo "Unsolved Vuln"
    fi
}
# Function to check if text does not exist in a file
check_text_not_exists() {
    local file="$1"
    local text="$2"
    local vuln_name="$3"
    
    if ! grep -q "$text" "$file"; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

# Function to check if a file exists
check_file_exists() {
    local file="$1"
    local vuln_name="$2"
    
    if [ -e "$file" ]; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

# Function to check if a file has been deleted
check_file_deleted() {
    local file="$1"
    local vuln_name="$2"
    
    if [ ! -e "$file" ]; then
        echo "Vulnerability fixed: '$vuln_name'" 
    else
        echo "Unsolved Vuln"
    fi
}
check_file_deleted2() {
    local file="$1"
    local file2="$2"
    local vuln_name="$3"
    
    if [ ! -e "$file" && ! -e "$file2" ]; then
        echo "Vulnerability fixed: '$vuln_name'" 
    else
        echo "Unsolved Vuln"
    fi
}
check_file_deleted3() {
    local file="$1"
    local file2="$2"
    local file3="$3"
    local vuln_name="$4"
    
    if [ ! -e "$file" && ! -e "$file2" && ! -e "$file3" ]; then
        echo "Vulnerability fixed: '$vuln_name'" 
    else
        echo "Unsolved Vuln"
    fi
}
check_file_permissions() {
    local file="$1"
    local expected_permissions="$2"
    local vuln_name="$3"
    
    # Get the actual permissions of the file in numeric form (e.g., 644)
    actual_permissions=$(stat -c "%a" "$file")
    
    if [ "$actual_permissions" == "$expected_permissions" ]; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

check_packages() {
    local package="$1"
    local vuln_name="$2"
    

    if [ dpkg --get-selections | grep -q "^$package[[:space:]]*install$" ]; then
        echo "Vulnerability fixed: '$vuln_name'"
    else
        echo "Unsolved Vuln"
    fi
}

echo " "
echo "Dallas Mint Brainrot"
echo " "

check_text_exists "/home/rizzler/Forensics1.txt" "Skibidi, Skibidi Hawk Tuah Hawk" "Forensics 1 correct"
check_text_exists "/home/rizzler/Forensics2.txt" "July 13" "Forensics 2 correct"
check_text_exists "/home/rizzler/Forensics3.txt" "LowTaperFade" "Forensics 3 correct"
check_text_not_exists "/etc/group" "koco:x:1006:" "User koco removed"
check_text_exists "/etc/group" "Prison:x:1016:diddy" "Diddy added to Prison"
check_text_not_exists "/etc/group" "grinch:x:1112:" "Hidden user Grinch removed"
check_text_not_exists "/etc/group" "sys:x:3:grimace" "User grimace removed from sys group"
check_file_deleted "/home/grimace/Fein.mp3" "Prohibited mp3 file removed"
check_file_deleted "/home/rizzler/Music/ThickofIt.mp3" "Prohibited mp3 file removed"
check_file_deleted "/home/rizzler/Pictures/chillguy.jpg" "Chill Guy image removed"
check_file_deleted "/root/.nothing_here" "Malicious File Removed"
check_file_deleted "/root/.secret" "Malicious File Removed"
check_text_not_exists "/etc/profile" "ALIAS=" "Annoying alias script removed"
check_text_exists "/etc/ufw/ufw.conf" "ENABLED=yes" "Firewall running"
check_text_not_exists "/etc/sudoers" "NOPASSWD" "Removed insecure sudoers rule"
check_file_deleted "/etc/sudoers.d/balsamicvinegar" "unnecessary sudeors file removed"
check_text_exists "/etc/ssh/sshd_config" "Port 22" "SSH runs on port 22"
check_text_exists "/etc/ssh/sshd_config" "AddressFamily inet" "SSH connections only use the IPv4 address family"
check_text_exists "/etc/ssh/sshd_config" "PermitRootLogin no" "SSH doesn't permit root login"
check_text_exists2 "/etc/ssh/sshd_config" "PasswordAuthentication no" "PubkeyAuthentication yes" "SSH uses key based authentication"
check_text_exists "/etc/vsftpd.conf" "anon_mkdir_write_enable=NO" "anonymous FTP user is unable to create new directories"
check_text_exists "/etc/vsftpd.conf" "ssl_enable=YES" "FTP SSL enabled"
check_text_exists "/etc/vsftpd.conf" "ssl_tlsv1=YES" "SSL uses secure TLS"
check_text_exists2 "/etc/vsftpd.conf" "force_local_logins_ssl=YES" "force_local_data_ssl=YES" "FTP forces SSL"
check_text_exists3 "/etc/vsftpd.conf" "pasv_min_port=50000" "pasv_min_port=50200" "pasv_enable=YES" "FTP passive port range set"
check_text_not_exists "/etc/ftpusers" "chillguy" "Chill Guy is not an ftpuser"
check_text_exists "/etc/squid/squid.conf" "http_port 3128" "squid http port set to 3128"
check_text_exists "/etc/squid/squid.conf" "http_access allow localhost" "squid allows localhost"
check_text_exists "/etc/squid/squid.conf" "http_access deny CONNECT !SSL_ports" "squid only allows connection from secure SSL ports"
check_file_permissions "/etc/shadow" "600" "Permissions on shadow file fixed"
check_text_exists "/etc/login.defs" "Max_Pass_Days = 90" "Max Pass Age set"
check_text_exists "/etc/login.defs" "ENCRYPT_METHOD SHA512" "SHA512 encryption enabled"
check_text_exists2 "/etc/apt/apt.conf.d/20auto-upgrades" "APT::Periodic::Update-Package-Lists "1";" "APT::Periodic::Unattended-Upgrade "1"" "System set to automatically update"
check_file_deleted2 "/etc/samba/" "/etc/apache2/" "Unauthorized services apache2 and samba removed"
check_packages "wireshark" "Wireshark removed"

check_text_not_exists "/root/.bashrc" "alias nano=" "malicious alias removed"
check_text_exists "/etc/audit/auditd.conf" "write_logs = yes" "auditd writes logs"
check_text_exists "/etc/audit/auditd.conf" "max_restarts = 10" "auditd has 10 max restarts"
check_text_exists "/etc/default/grub" "GRUB_DISABLE_RECOVERY="true"" "GRUB recovery disabled"
check_text_exists2 "/etc/grub.d/40_custom" "set check_signatures=enforce" "export check_signatures" "Grub check signatures enabled"













