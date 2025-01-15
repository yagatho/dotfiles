#!/usr/bin/env bash
kitty -c ~/DotFiles/Kitty/kitty.conf zsh &

sleep 0.5

hyprctl -q dispatch resizeactive -200 0
