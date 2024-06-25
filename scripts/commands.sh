#!/usr/bin/env bash 
# Path to the file containing the commands
COMMANDS_FILE="commands.txt"

# Check if the commands file exists
if [[ ! -f "$COMMANDS_FILE" ]]; then
  echo "Commands file not found: $COMMANDS_FILE"
  exit 1
fi

# Use rofi in dmenu mode to select a command
selected_command=$(cat "$COMMANDS_FILE" | fuzzel -d -p "Select a command")

# Check if a command was selected
if [[ -n "$selected_command" ]]; then
  # Execute the selected command
  eval "$selected_command"
else
  echo "No command selected"
fi
