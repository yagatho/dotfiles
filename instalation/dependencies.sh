#!/bin/bash
# Pacman
sudo pacman -S wl-clipboard man tldr git ttf-nerd-fonts-symbols-mono python dotnet-sdk btop nvim github-cli

# AUR
read -p "Install and compile wezterm? (Needs paru)(Y/N): " confirm && [[ $confirm != [yY] ]] || paru -S wezterm-git

