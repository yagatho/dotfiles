#!/bin/bash
# Pacman
sudo pacman -S wl-clipboard man tldr git ttf-nerd-fonts-symbols-mono python dotnet-sdk btop nvim github-cli qbittorrent discord firefox gimp


# AUR
read -p "Install and compile wezterm? (May take long time)(Needs paru)(Y/N): " confirm && [[ $confirm != [yY] ]] || paru -S wezterm-git

read -p "Install tidal? (Needs paru)(Y/N): " confirm && [[ $confirm != [yY] ]] || paru -S tidal-hifi-bin

read -p "Install unityhub? (Needs paru)(Y/N): " confirm && [[ $confirm != [yY] ]] || paru -S unityhub


# Other misc
# Enable multilib
sudo mv ~/git/dotfiles/misc/pacman.conf /etc/pacman.conf

read -p "Install blender? (Y/N): " confirm && [[ $confirm != [yY] ]] || sudo pacman -S blender

read -p "Install krita? (Y/N): " confirm && [[ $confirm != [yY] ]] || sudo pacman -S krita

read -p "Install vm?(Y/N): " confirm && [[ $confirm != [yY] ]] || ~/git/dotfiles/instalation/vm.sh

read -p "Install steam?(Y/N): " confirm && [[ $confirm != [yY] ]] || sudo pacman -S steam
