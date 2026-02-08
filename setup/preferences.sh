#!/bin/bash
# setup/preferences.sh

# Install wallpaper
echo "Setting up Wallpaper..."
wallpaper_name="shanghai-city-3840x2160-9420.jpeg"
wallpaper_link="https://4kwallpapers.com/images/wallpapers/$wallpaper_name"
wget $wallpaper_link && mv $wallpaper_name ~/Pictures/wallpaper.jpeg

# Set dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Set wallpaper
osascript -e 'tell application "System Events" to set picture of every desktop to "/Users/paulhondola/Pictures/wallpaper.jpeg"'

# Clear all persistent apps from the Dock
echo "Configuring Dock..."
defaults write com.apple.dock persistent-apps -array

# Restart the Dock to apply changes
killall Dock
