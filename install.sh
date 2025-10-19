#!/bin/bash

read -p "Install and compile paru? (Y/N): " confirm && [[ $confirm != [yY] ]] || exec ~/git/dotfiles/instalation/paru.sh

exec ~/git/dotfiles/instalation/dependencies.sh

read -p "Install zsh and plugins? (Y/N): " confirm && [[ $confirm != [yY] ]] || exec ~/git/dotfiles/instalation/zsh.sh

 exec ~/git/dotfiles/instalation/link.sh

