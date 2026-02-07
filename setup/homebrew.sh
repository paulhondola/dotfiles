#!/bin/bash
# setup/homebrew.sh

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
  echo
  echo "Homebrew not found. Installing..."
  echo
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for the current session
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo
  echo "Homebrew is already installed."
  echo
fi

# Append Homebrew initialization to .zprofile if not already present
if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' "${HOME}/.zprofile"; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}/.zprofile"
  echo "Added Homebrew shellenv to .zprofile"
else
  echo "Homebrew shellenv already in .zprofile"
fi

# Ensure Homebrew is available in the current shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check installation and update
echo
echo "Checking installation.."
echo
brew update && brew doctor
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Check for Brewfile in the current directory (assuming run from root) and use it if present
if [ -f "./homebrew/.Brewfile" ]; then
  echo
  echo "Brewfile found. Using it to install packages..."
  brew bundle --file="./homebrew/.Brewfile"
  echo "Installation from Brewfile complete."
else
    echo "Brewfile not found at ./homebrew/.Brewfile"
fi
