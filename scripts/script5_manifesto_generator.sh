#!/bin/bash
# Script 5: OpenSourceManifestoGenerator
# Purpose: Ask three questions and generate a short manifesto text file.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"

echo "Answer three questions to generate your manifesto."
echo ""

# Read answers interactively from the user.
read -rp "1. Name one open-source tool you use every day: " TOOL
read -rp "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -rp "3. Name one thing you would build and share freely: " BUILD

DATE_STAMP="$(date '+%d %B %Y')"
OUTPUT_FILE="manifesto_$(whoami).txt"

# You could create an alias on Linux such as:
# alias manifesto='./script5_manifesto_generator.sh'

# Compose a short personal paragraph using the answers provided above.
MANIFESTO_TEXT="On $DATE_STAMP, $STUDENT_NAME reflects on open source through $TOOL. To me, freedom means $FREEDOM, and that matters because open knowledge lets people learn, adapt, and improve tools together. If I could build one thing and share it freely, it would be $BUILD, because useful software becomes more meaningful when a community can study it, change it, and pass it forward."

{
  echo "Open Source Manifesto"
  echo "Generated on: $DATE_STAMP"
  echo "Student: $STUDENT_NAME"
  echo ""
  echo "$MANIFESTO_TEXT"
} > "$OUTPUT_FILE"

echo ""
echo "Manifesto saved to $OUTPUT_FILE"
echo "----------------------------------------------"
cat "$OUTPUT_FILE"
