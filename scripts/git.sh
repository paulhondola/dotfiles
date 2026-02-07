#!/bin/bash
# ABOUTME: Iterates through Faculta and Developer directories
# ABOUTME: Runs git pull in each git repository found

# Loop through all items in Faculta and Developer
for dir in Faculta/* Developer/*; do
    # Check if the directory contains a .git folder
    if [ -d "$dir/.git" ]; then
        echo "--------------------------------------------------"
        echo "Updating $dir..."
        (cd "$dir" && git pull)
    fi
done
