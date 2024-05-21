#!/bin/bash

app_name="$1"
app_path="$2"
log_file=~/dotfiles/.scripts/logs/open.log

mkdir -p ~/dotfiles/.scripts/logs

echo "Running open.sh" >> $log_file
echo "App Name: $app_name" >> $log_file
echo "App Path: $app_path" >> $log_file

# Open the application
echo "Opening $app_name" >> $log_file
open -na "$app_path"

# Final log entry
echo "open.sh completed" >> $log_file
echo "------------------------------" >> $log_file

