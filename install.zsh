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
special[kitty]="${XDG_CONFIG_HOME}/kitty"
special[nvim]="${XDG_CONFIG_HOME}/nvim"
special[.git]='SKIP'
special[Brewfile]='SKIP'
special[README.md]='SKIP'
special[install.zsh]='SKIP'

echo "Linking dotfiles..."
for FILE in $DOTFILES_DIR/*(D); do;
    local TARGET="${special[${FILE:t}]-${INSTALL_DIR}/${FILE:t}}"
    if [[ $TARGET == 'SKIP' ]]; then
        print -P -- "   %F{014}Link explicitly skipped:%f $FILE"
    elif [[ ! -a $TARGET ]]; then
        print -P -- "   %F{002}Linking:%f $FILE => $TARGET"
        mkdir -p $(dirname $TARGET)
        ln -s $FILE $TARGET
    else
        print -P -- "   %F{011}Link already exists:%f $FILE => $TARGET"
    fi
done

echo "Ensuring ssh signing key for git config..."
git config --global user.signingkey ~/.ssh/github

echo "Ensuring allowed_signers file for git config..."
local allowed_signers=~/.ssh/allowed_signers
if [ ! -f $allowed_signers ]; then
  touch $allowed_signers
  git config --global gpg.ssh.allowedSignersFile $allowed_signers 
  echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/github.pub)" >> $allowed_signers
fi


