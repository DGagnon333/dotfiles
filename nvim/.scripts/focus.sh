#!/bin/bash

app_name="$1"
log_file=~/dotfiles/.scripts/logs/focus.log

mkdir -p ~/dotfiles/.scripts/logs

echo "Running focus.sh" >> $log_file
echo "App Name: $app_name" >> $log_file

# Query for the window IDs of the application
window_ids=$(yabai -m query --windows | jq -r ".[] | select(.app == \"$app_name\") | .id")

# Log the found window IDs
echo "Window IDs: $window_ids" >> $log_file

# Get the first window ID from the list
first_window_id=$(echo "$window_ids" | head -n 1)

# Focus the window if found
if [ -n "$first_window_id" ]; then
  echo "Focusing $app_name with window ID $first_window_id" >> $log_file
  yabai -m window --focus "$first_window_id"
  echo "focus.sh completed successfully" >> $log_file
  echo "------------------------------" >> $log_file
  exit 0
else
  echo "No existing window found for $app_name" >> $log_file
  echo "focus.sh completed with errors" >> $log_file
  echo "------------------------------" >> $log_file
  exit 1
fi
