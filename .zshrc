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

# zgen
if [[ ! -d $HOME/.zgen ]]; then
  echo "predicate triggered"
  git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"
fi
export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
export ZGEN_PLUGIN_UPDATE_DAYS=15
export ZGEN_SYSTEM_UPDATE_DAYS=15
export NVM_LAZY_LOAD=true
source "$HOME/.zgen/zgen.zsh"
if ! zgen saved; then
  # plugins
  zgen load docker/cli contrib/completion/zsh
  zgen load lukechilds/zsh-nvm
  zgen load peterhurford/git-it-on.zsh
  zgen load rupa/z
  zgen load unixorn/autoupdate-zgen
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  # prezto config
  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto history
  zgen prezto directory
  zgen prezto helper
  zgen prezto spectrum
  zgen prezto utility
  zgen prezto completion
  zgen prezto prompt
  zgen prezto syntax-highlighting
  zgen prezto git
  zgen prezto editor key-bindings 'vi'
  zgen prezto '*:*' case-sensitive 'no'
  zgen prezto '*:*' color 'yes'
  zgen prezto 'module:editor' dot-expansion 'no'
  zgen prezto 'module:editor' key-bindings 'vi'
  zgen prezto 'module:syntax-highlighting' highlighters 'main' 'brackets' 'pattern' 'cursor'
  zgen prezto 'module:terminal' auto-title 'yes'
  # if [[ $OSTYPE == darwin* ]]; then zgen prezto prompt theme 'sorin'; else zgen prezto prompt theme 'skwp'; fi
  zgen prezto prompt theme 'sorin'
  zgen save
fi

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

# git aliases
function checkout_remote_branch() {
    local org="${1}"
    local branch="${2}"
    local repo="$(basename $(git rev-parse --show-toplevel))"

    function clean() {
        git remote remove "${1}"
    }
    trap "clean ${org}" EXIT

    git remote add "${org}" "git@github.com:${org}/${repo}.git" && \
        git fetch "${org}" "${branch}" && \
        git switch --no-track -C "${org}_${branch}" "${org}/${branch}"
}

alias -g grb="checkout_remote_branch"

# hook in direnv https://direnv.net/docs/hook.html#zsh
eval "$(direnv hook zsh)"

# set the shell's macos file descriptor and process limits
ulimit -n 524288

