#!/usr/bin/env bash

LOCK_FILE="/tmp/wallpaper_change.lock"

# Ensure lock file is removed on script exit
trap 'rm -f "$LOCK_FILE"' EXIT

# Check if lock file exists
if [[ -f "$LOCK_FILE" ]]; then
    echo "Zmiana tapety już trwa, anulowano."
    exit 1
fi

# Create lock file
touch "$LOCK_FILE"

# Find new and old wallpapers
NEW_WALLPAPER=$(find "$HOME/Wallpaper" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
OLD_WALLPAPER=$(find "$HOME/Wallpaper/Current" -type f \( -iname "*.jpg" -o -iname "*.png" \) | head -n 1)

# Ensure Current directory exists
mkdir -p "$HOME/Wallpaper/Current"

# Move new wallpaper to Current directory
if ! mv "$NEW_WALLPAPER" "$HOME/Wallpaper/Current"; then
    echo "Failed to move new wallpaper to Current directory."
    exit 1
fi

# Move old wallpaper back to Wallpaper directory
if [[ -n "$OLD_WALLPAPER" ]]; then
    if ! mv "$OLD_WALLPAPER" "$HOME/Wallpaper"; then
        echo "Failed to move old wallpaper back to Wallpaper directory."
        exit 1
    fi
else
    echo "Brak tapety w katalogu Current."
fi

# Get path of the new wallpaper
WALLPAPER_PATH="$(find "$HOME/Wallpaper/Current" -type f \( -iname "*.jpg" -o -iname "*.png" \) | head -n 1)"
echo "New wallpaper = $WALLPAPER_PATH"

# Set new wallpaper
if [[ -f "$WALLPAPER_PATH" ]]; then
    swww img "$WALLPAPER_PATH" --transition-type=outer
else
    echo "Invalid wallpaper path: $WALLPAPER_PATH"
    exit 1
fi

# Generate color schemes
if ! hellwal -i "$WALLPAPER_PATH"; then
    echo "Failed to generate hellwal color scheme."
    exit 1
fi
if ! wal -i "$WALLPAPER_PATH"; then
    echo "Failed to generate wal color scheme."
    exit 1
fi

# Copy hellwal colors to wal cache
cp "/home/yagatho/.cache/hellwal/colors.json" "/home/yagatho/.cache/wal"

# Update Discord theme
if ! pywalfox update; then
    echo "Failed to update Discord theme."
    exit 1
fi

# Remove lock file
rm -f "$LOCK_FILE"
