#!/usr/bin/env zsh
kitty -c ~/DotFiles/Kitty/kitty.conf zsh &

WALLPAPER_PATH="$(find "$HOME/Wallpaper/Current" -type f | head -n 1)"

sleep 0.5

hellwal -i "$WALLPAPER_PATH" --bright-offset 0.9


