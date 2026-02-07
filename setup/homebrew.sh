#!/bin/bash
# setup/homebrew.sh

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Install Homebrew
echo
echo "${GREEN}Installing Homebrew${NC}"
echo
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Append Homebrew initialization to .zprofile
# Check if it's already there to avoid duplicates? The original script didn't check.
# I'll stick to original logic but it's risky.
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>${HOME}/.zprofile

# Immediately evaluate the Homebrew environment settings for the current session
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check installation and update
echo
echo "${GREEN}Checking installation..${NC}"
echo
brew update && brew doctor
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Check for Brewfile in the current directory (assuming run from root) and use it if present
if [ -f "./homebrew/.Brewfile" ]; then
  echo
  echo "${GREEN}Brewfile found. Using it to install packages...${NC}"
  brew bundle --file="./homebrew/.Brewfile"
  echo "${GREEN}Installation from Brewfile complete.${NC}"
else
    echo "Brewfile not found at ./homebrew/.Brewfile"
fi
