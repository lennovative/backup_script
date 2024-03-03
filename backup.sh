#!/bin/bash

# Check if both source and destination directories are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory> [--dry-run]"
    exit 1
fi

SOURCE_DIR="$1"
DESTINATION_DIR="$2"
DRY_RUN=false

# Check if the optional parameter --dry-run is provided
if [ "$#" -eq 3 ] && [ "$3" == "--dry-run" ]; then
    DRY_RUN=true
fi

# Check if source and destination directories exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

if [ ! -d "$DESTINATION_DIR" ]; then
    echo "Destination directory '$DESTINATION_DIR' does not exist."
    exit 1
fi

echo "Start backup: '$SOURCE_DIR' to '$DESTINATION_DIR'"

# Set options for rsync run
RUN_OPTIONS="-av --progress --no-perms --delete"

# Perform dry run
echo "Performing dry run..."
rsync $RUN_OPTIONS --dry-run "$SOURCE_DIR" "$DESTINATION_DIR"

# Perform dry run if specified
if [ "$DRY_RUN" = true ]; then
    exit
fi

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
