#!/bin/bash
# Script 1: SystemIdentityReport
# Purpose: Introduce the Linux system like a welcome screen.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"

# Read the distribution name from the standard os-release file.
if [ -f /etc/os-release ]; then
  DISTRO_NAME="$(. /etc/os-release && echo "$PRETTY_NAME")"
else
  DISTRO_NAME="Unknown Linux Distribution"
fi

# Collect system facts using simple command substitution.
KERNEL_VERSION="$(uname -r)"
CURRENT_USER="$(whoami)"
HOME_DIRECTORY="$HOME"
SYSTEM_UPTIME="$(uptime -p)"
CURRENT_DATE_TIME="$(date '+%d %B %Y %I:%M:%S %p %Z')"

# Display the report in a readable format.
echo "=============================================="
echo " Open Source Audit - System Identity Report"
echo "=============================================="
echo "Student Name     : $STUDENT_NAME"
echo "Roll Number      : $ROLL_NUMBER"
echo "Chosen Software  : $SOFTWARE_CHOICE"
echo "Distribution     : $DISTRO_NAME"
echo "Kernel Version   : $KERNEL_VERSION"
echo "Current User     : $CURRENT_USER"
echo "Home Directory   : $HOME_DIRECTORY"
echo "System Uptime    : $SYSTEM_UPTIME"
echo "Current DateTime : $CURRENT_DATE_TIME"
echo "OS License Note  : $LICENSE_NOTE"
echo "=============================================="
