#!/bin/bash
# setup/macos_update.sh

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Update macOS
echo
echo "${GREEN}Looking for updates..${NC}"
echo
sudo softwareupdate -i -a

# Install Rosetta
sudo softwareupdate --install-rosetta --agree-to-license
