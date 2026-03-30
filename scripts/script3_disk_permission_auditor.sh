#!/bin/bash
# Script 3: DiskandPermissionAuditor
# Purpose: Report size, owner, group, and permissions for important Linux directories.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================================="
echo " Directory Audit Report"
echo "=============================================="

# Loop through important directories and audit them one by one.
for DIR in "${DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    PERMS="$(ls -ld "$DIR" | awk '{print $1, $3, $4}')"
    SIZE="$(du -sh "$DIR" 2>/dev/null | cut -f1)"
    echo "$DIR => Permissions/Owner: $PERMS | Size: $SIZE"
  else
    echo "$DIR does not exist on this system."
  fi
done

echo "----------------------------------------------"
echo " Chosen Software Config Directory Check"
echo "----------------------------------------------"

# Check the real configuration directory for the chosen software.
if [ -n "$CONFIG_DIR" ] && [ -d "$CONFIG_DIR" ]; then
  CONFIG_PERMS="$(ls -ld "$CONFIG_DIR" | awk '{print $1, $3, $4}')"
  echo "$CONFIG_DIR => Permissions/Owner: $CONFIG_PERMS"
else
  echo "Config directory not found: $CONFIG_DIR"
fi

echo "=============================================="
