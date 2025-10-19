#!/bin/bash
# Remove dirs befor linking
rm -rf ~/.config/hypr
rm -rf ~/.config/nvim
rm -rf ~/.config/quickshell

ln -s ~/git/dotfiles/nvim ~/.config/nvim 
ln -s ~/git/dotfiles/hypr ~/.config/hypr 
ln -s ~/git/dotfiles/quickshell/ ~/.config/quickshell 




