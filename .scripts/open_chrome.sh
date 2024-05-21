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
  open -na "$CHROME" --args --profile-directory="$PROFILE" "${URLS[@]}"
}

# Call the focus script for Google Chrome
~/dotfiles/.scripts/focus.sh "Google Chrome"

# If Chrome is not focused, open with specified profile and tabs
if ! pgrep -fl "Google Chrome" > /dev/null; then
  open_chrome_with_tabs
else
  echo "Google Chrome is already open" >> $log_file
fi

echo "open_chrome.sh completed" >> $log_file
echo "------------------------------" >> $log_file
