#!/bin/bash
# setup/macos_update.sh

# Update macOS
echo "Looking for updates.."
sudo softwareupdate -i -a

# Install Rosetta
echo "Installing Rosetta.."
sudo softwareupdate --install-rosetta --agree-to-license
