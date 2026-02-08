#!/bin/bash
# MacOS Setup Script

# Load config if it exists
[ -f "./config" ] && source ./config

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
echo "Running macOS updates..."
./setup/macos_update.sh

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
else
  echo "Oh My Zsh already installed."
fi

# Install Homebrew
echo "Running Homebrew setup..."
./setup/homebrew.sh

# Stow dotfiles
echo "Stowing dotfiles..."
./setup/dotfiles.sh

# Install wallpaper and preferences
echo "Setting up preferences..."
./setup/preferences.sh

# Final cleanup or messages
echo
echo "Setup Complete!"
