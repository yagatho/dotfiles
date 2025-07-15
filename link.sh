#!/bin/bash

# Remove dirs befor linking
rm -rf ~/.config/hypr
rm -rf ~/.config/nvim
rm -rf ~/.config/ghostty

ln -s ~/git/dotfiles/ghostty ~/.config/ghostty 
ln -s ~/git/dotfiles/nvim ~/.config/nvim 
ln -s ~/git/dotfiles/hypr ~/.config/hypr 
