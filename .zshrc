# -- Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# -- Exports
export PATH=$PATH:$HOME/minio-binaries/

# -- Settngs
ZSH_THEME="robbyrussell"


# -- Plugins
plugins=(git zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete)
source $ZSH/oh-my-zsh.sh

# -- Aliases
alias chwall="./git/dotfiles/ShellScripts/Wallpaper/wallpaper.sh"
