#!/bin/bash

perform_backup() {
    local source="$1"
    local destination="$2"

    # Check if source and destination directories exist
    if [ ! -d "$source" ]; then
        echo "Source directory '$source' does not exist."
        return 1
    fi

    if [ ! -d "$destination" ]; then
        echo "Destination directory '$destination' does not exist."
        return 1
    fi

    echo "Start backup: '$source' to '$destination'..."
    # Call the backup script
    ./backup.sh "$source" "$destination"
}

perform_backup "/path/to/source1" "/path/to/destination1"
perform_backup "/path/to/source2" "/path/to/destination2"
perform_backup "/path/to/source3" "/path/to/destination3"
# ...
