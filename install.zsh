#!/bin/env zsh
set -e
setopt EXTENDED_GLOB

# Find the current directory
local DOTFILES_DIR="$(cd $(dirname ${BASH_SOURCE[0]-$0}) && pwd)"

# Default config variables 
local XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
local INSTALL_DIR="${INSTALL_DIR:-$HOME}"

# Symlink dotfiles
declare -A special
special[kitty.conf]="${XDG_CONFIG_HOME}/kitty/kitty.conf"
special[Brewfile]='SKIP'
special[README.md]='SKIP'
special[monokai-soda.itermcolors]='SKIP'
special[.git]='SKIP'

echo "Linking dotfiles..."
for FILE in $DOTFILES_DIR/*(D); do;
    local TARGET="${special[${FILE:t}]-${INSTALL_DIR}/${FILE:t}}"

    if [[ $TARGET == 'SKIP' ]]; then
        print -P -- "   %F{014}Link explicitly skipped:%f $FILE"
    elif [[ ! -a $TARGET ]]; then
        print -P -- "   %F{002}Linking:%f $FILE => $TARGET"
        ln -s $FILE $TARGET
    else
        print -P -- "   %F{011}Link already exists:%f $FILE => $TARGET"
    fi
done


