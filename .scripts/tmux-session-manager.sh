#!/bin/bash

# List tmux sessions
sessions=$(tmux ls 2>/dev/null)
if [ -z "$sessions" ]; then
  echo "No tmux sessions found."
  exit 0
fi

echo "Available tmux sessions:"
echo "$sessions"

# Prompt to attach to a session
read -p "Enter the name of the session to attach: " session_name
tmux attach-session -t "$session_name"
