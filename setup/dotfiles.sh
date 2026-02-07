#!/bin/bash
# setup/dotfiles.sh

# Stow dotfiles
echo
echo "Stowing dotfiles..."

# Loop through directories in the current directory
for d in */; do
    # Exclude the setup directory and git directory from stowing if needed
    # The original script stowed everything '*/'
    dirname="${d%/}"
    if [ "$dirname" == "setup" ] || [ "$dirname" == ".git" ]; then
        echo "Skipping $dirname"
        continue
    fi
    
    echo "Stowing $dirname"
    stow --adopt -v "$dirname"
done

echo "Dotfiles stowed."
