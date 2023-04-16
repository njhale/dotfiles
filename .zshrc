# profile startup
zmodload zsh/zprof

# add the argument to $PATH only if it's not already present
function extend_path() {
  [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

# add the argument's directory to $PATH if the argument exists
function conditional_extend_path() {
  [[ -a $1 ]] && extend_path $(dirname $1)
}

# add ~/bin and ~/.local/bin to $PATH if they exist
[[ -d "$HOME/bin" ]] && extend_path "$HOME/bin"
[[ -d "$HOME/.local/bin" ]] && extend_path "$HOME/.local/bin"

# brew installs some binaries like openvpn to /usr/local/sbin
[[ $OSTYPE == darwin* ]] && extend_path "/usr/local/sbin"


if type brew &> /dev/null; then
  # Enable brew installed completions
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# use vim bindings for zsh
bindkey -v

# disable ctrl+d EOF
setopt ignoreeof

# prefer neovim as the default editor
if which nvim > /dev/null; then
  export EDITOR=nvim
  alias vi=nvim
  alias vim=nvim
else
  export EDITOR=vim
  alias nvim=vim
fi
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

# prefer GNU sed b/c BSD sed doesn't handle whitespace the same
if which gsed > /dev/null; then export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"; fi

# rust (b/c rustup doesn't play well with the rust brew formulae)
if ! which rustup > /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# set GOPATH and GOBIN
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# kubernetes
if which kubectl > /dev/null; then
  alias k=kubectl
  export KUBECONFIG="$HOME/.kube/config"
fi

# acorn dev path and shell completion
if [ -d "/Users/njhale/projects/acorn" ]
then
  export PATH="/Users/njhale/projects/acorn/bin:$PATH"
  source <(acorn completion zsh)
fi


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/njhale/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# install starship prompt
# https://starship.rs
eval "$(starship init zsh)"
