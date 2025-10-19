#!/bin/bash
sudo pacman -Syu

read -p "Install and compile paru? (Y/N): " confirm && [[ $confirm != [yY] ]] || ~/git/dotfiles/instalation/paru.sh

echo "Installing dependencies... "
~/git/dotfiles/instalation/dependencies.sh

read -p "Install zsh and plugins? (Y/N): " confirm && [[ $confirm != [yY] ]] || ~/git/dotfiles/instalation/zsh.sh

echo "Linking configs... "
~/git/dotfiles/instalation/link.sh

read -p "Configure git and github? (Y/N): " confirm && [[ $confirm != [yY] ]] || ~/git/dotfiles/instalation/git.sh

read -p "Install hyprland plugins? (Y/N): " confirm && [[ $confirm != [yY] ]] || ~/git/dotfiles/instalation/hyprplugins.sh
