#!/usr/bin/bash
ghostty &

WALLPAPER_PATH="$(find "$HOME/Wallpaper/Current" -type f | head -n 1)"

sleep 0.5

wal -i "$WALLPAPER_PATH"


