#!/bin/bash

app_name="$1"
app_path="$2"

# Call the focus script
~/dotfiles/.scripts/focus.sh "$app_name"

# If the application is not focused, call the open script
if ! pgrep -fl "$app_name" > /dev/null; then
    ~/dotfiles/.scripts/open.sh "$app_name" "$app_path"
else
    ~/dotfiles/.scripts/focus.sh "$app_name" "$app_path"
fi

