#!/bin/bash

app_name="$1"
app_path="${2:-$app_name}"
log_file=~/dotfiles/.scripts/logs/focus_or_open.log

mkdir -p ~/dotfiles/.scripts/logs

echo "Running focus_or_open.sh" >> $log_file
echo "App Name: $app_name" >> $log_file
echo "App Path: $app_path" >> $log_file

# Call the focus script
~/dotfiles/.scripts/focus.sh "$app_name"
focus_result=$?

if [ $focus_result -ne 0 ]; then
  echo "Application $app_name not focused, trying to open it" >> $log_file
  ~/dotfiles/.scripts/open.sh "$app_name" "$app_path"
  open_result=$?
  if [ $open_result -ne 0 ]; then
    echo "Error: Application $app_name could not be opened" >> $log_file
    echo "focus_or_open.sh completed with errors" >> $log_file
    echo "------------------------------" >> $log_file
    exit 1
  else
    echo "Application $app_name opened successfully" >> $log_file
    echo "focus_or_open.sh completed successfully" >> $log_file
    echo "------------------------------" >> $log_file
    exit 0
  fi
else
  echo "Application $app_name focused successfully" >> $log_file
  echo "focus_or_open.sh completed successfully" >> $log_file
  echo "------------------------------" >> $log_file
  exit 0
fi
