#!/bin/bash

app_name="$1"
app_path="${2:-$app_name}"
log_file=~/dotfiles/.scripts/logs/open.log

mkdir -p ~/dotfiles/.scripts/logs

echo "Running open.sh" >> $log_file
echo "App Name: $app_name" >> $log_file
echo "App Path: $app_path" >> $log_file

# Open the application
if open -Ra "$app_path"; then
  echo "Opening $app_name" >> $log_file
  open -na "$app_path"
  echo "open.sh completed successfully" >> $log_file
  echo "------------------------------" >> $log_file
  exit 0
else
  echo "Error: Application $app_name not found at $app_path" >> $log_file
  echo "open.sh completed with errors" >> $log_file
  echo "------------------------------" >> $log_file
  exit 1
fi
