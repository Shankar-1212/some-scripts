#!/bin/bash

# Set the scripts directory path
SCRIPTS_DIR="$HOME/scripts"

# List all the script names in the scripts directory
SCRIPTS_LIST=$(ls $SCRIPTS_DIR | grep -E '.sh$')

# Use dmenu to select a script
chosen_script=$(echo "$SCRIPTS_LIST" | dmenu -p "Choose a script:")

# Check if a script was chosen, and execute it if valid
if [ -n "$chosen_script" ]; then
    chosen_script_path="$SCRIPTS_DIR/$chosen_script"
    chmod +x "$chosen_script_path" # Ensure the script is executable
    "$chosen_script_path"
fi
