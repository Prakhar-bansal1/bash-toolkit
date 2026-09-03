#!/bin/bash

# ==============================================================================
# Script Name: update_system.sh
# Description: Automates system package updates with privilege checking and OS detection.
# Usage:       sudo ./update_system.sh
# ==============================================================================

# Check if the script is running with elevated privileges (root EUID is 0)
if [ "$EUID" -ne 0 ]; then
    echo "[!] Error: Please run this script with sudo or as root."
    exit 1
fi

# Detect system package manager and run system updates
if [ -f /etc/debian_version ]; then
    echo "[+] Debian/Ubuntu system detected. Updating packages..."
    apt update && apt upgrade -y && apt autoremove -y
elif [ -f /etc/arch-release ]; then
    echo "[+] Arch Linux system detected. Updating packages..."
    pacman -Syu --noconfirm
elif [ -f /etc/redhat-release ]; then
    echo "[+] RHEL/Fedora system detected. Updating packages..."
    dnf update -y
else
    echo "[!] Error: Unsupported distribution."
    exit 1
fi

echo "[*] System update completed successfully!"