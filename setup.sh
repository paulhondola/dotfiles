#!/bin/bash
# MacOS Setup Script

# Load config if it exists
[ -f "./config" ] && source ./config

# COLOR
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Setup as root
echo "Setting up as root"
sudo -v

# Keep Sudo until script is finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Update macOS
echo "${GREEN}Running macOS updates...${NC}"
./setup/macos_update.sh

# Install Homebrew
echo "${GREEN}Running Homebrew setup...${NC}"
./setup/homebrew.sh

# Stow dotfiles
echo "${GREEN}Stowing dotfiles...${NC}"
./setup/dotfiles.sh

# Install wallpaper and preferences
echo "${GREEN}Setting up preferences...${NC}"
./setup/preferences.sh

# Final cleanup or messages
echo
echo "${GREEN}Setup Complete!${NC}"
