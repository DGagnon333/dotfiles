#!/bin/bash

app_name="$1"
app_path="$2"
log_file=~/focus_or_open.log

echo "Running focus_or_open.sh" >> $log_file
echo "App Name: $app_name" >> $log_file
echo "App Path: $app_path" >> $log_file

# Query for the window IDs of the application
window_ids=$(yabai -m query --windows | jq -r ".[] | select(.app == \"$app_name\") | .id")

# Log the found window IDs
echo "Window IDs: $window_ids" >> $log_file

# Get the first window ID from the list
first_window_id=$(echo "$window_ids" | head -n 1)

# Focus the window if found, otherwise open a new instance
if [ -n "$first_window_id" ]; then
  echo "Focusing $app_name with window ID $first_window_id" >> $log_file
  yabai -m window --focus "$first_window_id"
else
  echo "Opening $app_name" >> $log_file
  open -na "$app_path"
fi

# Final log entry
echo "focus_or_open.sh completed" >> $log_file
echo "------------------------------" >> $log_file

