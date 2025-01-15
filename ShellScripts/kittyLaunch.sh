#!/usr/bin/env zsh
kitty -c ~/DotFiles/Kitty/kitty.conf zsh &

WALLPAPER_PATH="$(find "$HOME/Wallpaper/Current" -type f | head -n 1)"

sleep 0.5q

hellwal -i "$WALLPAPER_PATH"
wal -i "$WALLPAPER_PATH"


