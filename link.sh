#!/bin/bash

# Install dependencies
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo pacman -S wl-clipboard man tldr zsh git ttf-nerd-fonts-symbols-mono python dotnet-sdk btop

# Paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# Remove dirs befor linking
rm -rf ~/.config/hypr
rm -rf ~/.config/nvim

ln -s ~/git/dotfiles/nvim ~/.config/nvim 
ln -s ~/git/dotfiles/hypr ~/.config/hypr 

# Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

cp ~/git/dotfiles/.zshrc ~/

chsh -s /usr/bin/zsh

# AUR
paru -S wezterm-git
paru -S github-cli

