# MacOS Setup Script
source ./config

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
echo
echo "${GREEN}Looking for updates.."
echo
sudo softwareupdate -i -a

# Install Rosetta
sudo softwareupdate --install-rosetta --agree-to-license

# Install Homebrew
echo
echo "${GREEN}Installing Homebrew"
echo
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Append Homebrew initialization to .zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>${HOME}/.zprofile
# Immediately evaluate the Homebrew environment settings for the current session
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check installation and update
echo
echo "${GREEN}Checking installation.."
echo
brew update && brew doctor
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Check for Brewfile in the current directory and use it if present
if [ -f "./homebrew/.Brewfile" ]; then
  echo
  echo "${GREEN}Brewfile found. Using it to install packages..."
  brew bundle
  echo "${GREEN}Installation from Brewfile complete."
fi

# Stow dotfiles
echo
echo "${GREEN}Stowing dotfiles..."
for d in */; do
    stow --adopt -v "${d%/}"
done
echo "${GREEN}Dotfiles stowed."

# Set dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Set mouse accelration off
osascript -e 'tell application "System Events" to tell mouse to set acceleration to 0'

# Set trackpad to natural scrolling
osascript -e 'tell application "System Events" to tell trackpad to set scrolling to natural'

# Clear all persistent apps from the Dock
defaults write com.apple.dock persistent-apps -array

# Restart the Dock to apply changes
killall Dock

# Install wallpaper
wallpaper_name="shanghai-city-3840x2160-9420.jpeg"
wallpaper_link="https://4kwallpapers.com/images/wallpapers/$wallpaper_name"
wget $wallpaper_link && mv $wallpaper_name ~/Pictures/wallpaper.jpeg
osascript -e 'tell application "System Events" to set picture of every desktop to "/Users/paulhondola/Pictures/wallpaper.jpeg"'
