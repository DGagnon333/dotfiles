#!/bin/bash

log_file=~/dotfiles/.scripts/logs/open.log

mkdir -p ~/dotfiles/.scripts/logs

# URLs to open in Google Chrome
URLS=(
  "https://dev.azure.com/Bathfitter-Dev/CRM%20-%20Customer%20relationship%20management/_boards/board/t/ICC/Stories?System.IterationPath=CRM%20-%20Customer%20relationship%20management%5CICC%20-%20Pilot%5CICC%20-%20Sprint%201%2CCRM%20-%20Customer%20relationship%20management%5CICC%20-%20Full%5CICC%20-%20Full%20-%20Sprint%20-%201"
  "https://github.com"
  "https://chatgpt.com"
)

# Profile directory name (replace with your actual profile directory)
PROFILE="Profile 1"

# Path to the Google Chrome application
CHROME="/Applications/Google Chrome.app"

# Function to open Google Chrome with specific profile and tabs
open_chrome_with_tabs() {
  echo "Opening Google Chrome with profile and tabs" >> $log_file
  if open -na "$CHROME" --args --profile-directory="$PROFILE" "${URLS[@]}"; then
    echo "Google Chrome opened with tabs successfully" >> $log_file
  else
    echo "Error: Failed to open Google Chrome with tabs" >> $log_file
    echo "open_chrome.sh completed with errors" >> $log_file
    echo "------------------------------" >> $log_file
    exit 1
  fi
}

# Call the focus script for Google Chrome
~/dotfiles/.scripts/focus.sh "Google Chrome" &
focus_result=$?

# If Chrome is not focused, open with specified profile and tabs
if [ $focus_result -ne 0 ]; then
  echo "Google Chrome not focused, trying to open it" >> $log_file
  open_chrome_with_tabs
else
  echo "Google Chrome is already open and focused" >> $log_file
fi

echo "open_chrome.sh completed" >> $log_file
echo "------------------------------" >> $log_file
exit 0
