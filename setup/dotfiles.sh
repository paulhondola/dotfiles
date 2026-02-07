#!/bin/bash
# setup/dotfiles.sh

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Stow dotfiles
echo
echo "${GREEN}Stowing dotfiles...${NC}"

# Loop through directories in the current directory
for d in */; do
    # Exclude the setup directory and git directory from stowing if needed
    # The original script stowed everything '*/'
    dirname="${d%/}"
    if [ "$dirname" == "setup" ] || [ "$dirname" == ".git" ] || [ "$dirname" == "scripts" ]; then
        echo "Skipping $dirname"
        continue
    fi
    
    echo "Stowing $dirname"
    stow --adopt -v "$dirname"
done

echo "${GREEN}Dotfiles stowed.${NC}"
