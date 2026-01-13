#!/bin/bash

# Define screenshot directory
SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOTS_DIR"

# Generate a unique filename with a timestamp
FILENAME="screenshot_$(date +'%Y%m%d_%H%M%S').png"
FILE_PATH="$SCREENSHOTS_DIR/$FILENAME"

# Use slurp to select a region, then grim to capture it and save to the file
grim -g "$(slurp)" "$FILE_PATH"

# Optional: Send a notification when the screenshot is saved (requires libnotify and a notification daemon like mako)
notify-send "Screenshot Captured" "Saved to $FILE_PATH"