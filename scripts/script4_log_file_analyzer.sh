#!/bin/bash
# Script 4: LogFileAnalyzer
# Purpose: Read a log file line by line, count keyword matches, and print a summary.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./config.sh
source "$SCRIPT_DIR/config.sh"

LOGFILE="${1:-$DEFAULT_LOG_FILE}"
KEYWORD="${2:-error}"
COUNT=0
ATTEMPT=1
MAX_ATTEMPTS=3

if [ ! -f "$LOGFILE" ]; then
  echo "Error: File $LOGFILE not found."
  echo "Usage: $0 [logfile] [keyword]"
  exit 1
fi

if [ ! -r "$LOGFILE" ]; then
  echo "Error: File $LOGFILE exists, but the current user cannot read it."
  echo "Try running: sudo $0 \"$LOGFILE\" \"$KEYWORD\""
  exit 1
fi

# Bash has no native do-while loop, so this while loop runs first and checks after.
while true; do
  if [ -s "$LOGFILE" ]; then
    break
  fi

  if [ "$ATTEMPT" -ge "$MAX_ATTEMPTS" ]; then
    echo "Error: File $LOGFILE exists but is still empty after $MAX_ATTEMPTS checks."
    exit 1
  fi

  echo "Notice: $LOGFILE is empty. Retrying in 2 seconds..."
  sleep 2
  ATTEMPT=$((ATTEMPT + 1))
done

# Read the file line by line and count every matching line.
while IFS= read -r LINE; do
  if echo "$LINE" | grep -iq "$KEYWORD"; then
    COUNT=$((COUNT + 1))
  fi
done < "$LOGFILE"

echo "=============================================="
echo " Log File Analyzer Summary"
echo "=============================================="
echo "Log file : $LOGFILE"
echo "Keyword  : $KEYWORD"
echo "Matches  : $COUNT"
echo "----------------------------------------------"
echo "Last 5 matching lines:"

MATCH_LINES="$(grep -i "$KEYWORD" "$LOGFILE" | tail -n 5)"

if [ -n "$MATCH_LINES" ]; then
  echo "$MATCH_LINES"
else
  echo "No matching lines were found."
fi

echo "=============================================="
