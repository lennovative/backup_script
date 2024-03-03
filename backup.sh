#!/bin/bash

# Check if both source and destination directories are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

SOURCE_DIR="$1"
DESTINATION_DIR="$2"

# Set options for rsync dry run
DRY_RUN_OPTIONS="-avn --progress --no-perms --delete"

# Set options for rsync actual run
RUN_OPTIONS="-av --progress --no-perms --delete"

# Perform dry run
echo "Performing dry run..."
rsync $DRY_RUN_OPTIONS "$SOURCE_DIR" "$DESTINATION_DIR"

# Prompt for confirmation
read -p "Proceed backup? (y/n): " choice
case "$choice" in
  y|Y ) 
    # Perform actual run
    echo "Starting backup..."
    rsync $RUN_OPTIONS "$SOURCE_DIR" "$DESTINATION_DIR"
    ;;
  n|N ) 
    echo "Backup canceled."
    ;;
  * ) 
    echo "Invalid choice. Backup canceled."
    ;;
esac
