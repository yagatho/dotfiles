#!/bin/bash
# Remove dirs befor linking
rm -rf ~/.config/hypr
rm -rf ~/.config/nvim

ln -s ~/git/dotfiles/nvim ~/.config/nvim 
ln -s ~/git/dotfiles/hypr ~/.config/hypr 




