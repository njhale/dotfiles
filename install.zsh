#!/bin/zsh

set -e
setopt EXTENDED_GLOB

# Default config variables 
export INSTALL_DIR=${INSTALL_DIR:-$HOME}
export DOTFILES_DIR=${DOTFILES_DIR:-$HOME/dotfiles}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$INSTALL_DIR/.config}

# Symlink dotfiles
echo "Linking dotfiles..."
for FILE in $DOTFILES_DIR/(.??*)(.N); do;
    local TARGET=$INSTALL_DIR/${FILE:t}
    if [[ ! -a $TARGET ]]; then
        print -P -- "   %F{002}Linking file:%f $FILE => $TARGET"
        ln -s $FILE $TARGET
    else
        print -P -- "   %F{011}Link already exists:%f $FILE => $TARGET"
    fi
done

