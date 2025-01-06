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

echo " "
echo "Dallas Mint Brainrot"
echo " "

check_text_exists "/home/rizzler/Forensics1.txt" "Skibidi, Skibidi Hawk Tuah Hawk" "Forensics 1 correct"
check_text_exists "/home/rizzler/Forensics2.txt" "July 13" "Forensics 2 correct"
check_text_exists "/home/rizzler/Forensics3.txt" "LowTaperFade" "Forensics 3 correct"
check_text_exists "/etc/group" "koco:x:1006:" "User koco removed"
check_text_exists "/etc/group" "Prison:x:1016:diddy" "Diddy added to Prison"
check_text_not_exists "/etc/group" "grinch:x:1112:" "Hidden user Grinch removed"
check_text_exists "/etc/group" "sys:x:3:grimace" "User grimace removed from sys group"
check_file_deleted "/home/grimace/Fein.mp3" "Prohibited mp3 file removed"
check_file_deleted "/home/rizzler/Music/ThickofIt.mp3" "Prohibited mp3 file removed"
check_file_deleted "/home/rizzler/Pictures/chillguy.jpg" "Chill Guy image removed"
check_file_deleted "/root/.nothing_here" "Malicious File Removed"
check_file_deleted "/root/.secret" "Malicious File Removed"
check_text_exists "/etc/ufw/ufw.conf" "Enabled=yes" "Firewall running"
check_text_not_exists "/etc/sudoers" "NOPASSWD" "Removed insecure sudoers rule"
check_text_exists "/etc/ssh/sshd_config" "Port 22" "SSH runs on port 22"
check_text_exists "/etc/ssh/sshd_config" "AddressFamily inet" "SSH connections only use the IPv4 address family"
check_text_exists "/etc/ssh/sshd_config" "PermitRootLogin no" "SSH doesn't permit root login"
check_text_exists "/etc/ssh/sshd_config" "PermitUserEnvironment no" "SSH doesn't permit user environment"
check_text_exists "/etc/vsftpd.conf" "anon_mkdir_write_enable=NO" "anonymous FTP user is unable to create new directories"
check_text_exists "/etc/vsftpd.conf" "ssl_enable=YES" "FTP SSL enabled"
check_text_exists "/etc/vsftpd.conf" "ssl_tlsv1=YES" "SSL uses secure TLS"
check_text_exists "/etc/vsftpd.conf" "force_local_logins_ssl=YES" "FTP forces SSL on logins"
check_text_exists "/etc/vsftpd.conf" "
pasv_min_port=50000
pasv_min_port=50200" "FTP passive port range set"
