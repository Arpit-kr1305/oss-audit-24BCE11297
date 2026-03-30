#!/bin/bash
# Script 2: FOSSPackageInspector
# Purpose: Check whether the chosen package is installed and print a philosophy note.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"

PACKAGE="${1:-$PACKAGE_NAME}"

print_philosophy_note() {
  case "$1" in
    git)
      echo "Git: a distributed version control system born from the need for open collaboration."
      ;;
    apache2|httpd)
      echo "Apache HTTP Server: the web server that helped build the open internet."
      ;;
    mysql|mysql-server)
      echo "MySQL: open-source data storage at the core of many real-world applications."
      ;;
    firefox)
      echo "Firefox: a browser shaped by the idea that the web should stay open and user-first."
      ;;
    vlc)
      echo "VLC: a community-driven media player designed to play almost anything."
      ;;
    libreoffice)
      echo "LibreOffice: a community fork that shows how open source can preserve user freedom."
      ;;
    python3|python)
      echo "Python: a language whose growth reflects the power of open contribution and shared learning."
      ;;
    linux-image*|kernel*|linux)
      echo "Linux kernel: the open foundation that powers servers, clouds, devices, and developer workflows."
      ;;
    *)
      echo "$SOFTWARE_CHOICE: open-source software maintained in the spirit of shared improvement."
      ;;
  esac
}

echo "=============================================="
echo " FOSS Package Inspector"
echo "=============================================="
echo "Requested package: $PACKAGE"

# Use RPM if available, otherwise fall back to Debian package tools.
if command -v rpm >/dev/null 2>&1; then
  if rpm -q "$PACKAGE" >/dev/null 2>&1; then
    echo "$PACKAGE is installed."
    rpm -qi "$PACKAGE" | grep -E '^(Name|Version|Release|License|Summary)'
  else
    echo "$PACKAGE is NOT installed."
  fi
elif command -v dpkg-query >/dev/null 2>&1; then
  if dpkg-query -W -f='${Status}\n' "$PACKAGE" 2>/dev/null | grep -q 'install ok installed'; then
    echo "$PACKAGE is installed."
    dpkg-query -W -f='Package: ${Package}\nVersion: ${Version}\nStatus: ${Status}\n' "$PACKAGE"

    # Debian metadata does not always expose license in the package database, so we
    # check the standard copyright file when it exists.
    if [ -f "/usr/share/doc/$PACKAGE/copyright" ]; then
      grep -i -m 3 'license' "/usr/share/doc/$PACKAGE/copyright"
    else
      echo "License: inspect the package copyright file or upstream LICENSE file."
    fi
  else
    echo "$PACKAGE is NOT installed."
  fi
else
  echo "No supported package manager metadata tool was found."
fi

print_philosophy_note "$PACKAGE"
echo "=============================================="
