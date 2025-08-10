#!/bin/bash

# Define the backup directory path
BACKUP_DIR="$HOME/backup"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Get current date and time in format YYYY-MM-DD_HH-MM-SS
CURRENT_TIME=$(date +"%Y-%m-%d_%H-%M-%S")

# Loop through all .txt files in the current directory
for file in *.txt; do
    # Check if any .txt files exist to avoid errors
    if [[ -f "$file" ]]; then
        # Get the base filename without extension
        BASENAME=$(basename "$file" .txt)
        # Define new filename with date and time appended
        NEW_FILENAME="${BASENAME}_$CURRENT_TIME.txt"
        # Copy the file to the backup directory with the new name
        cp "$file" "$BACKUP_DIR/$NEW_FILENAME"
    fi
done
