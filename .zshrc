# profile startup
zmodload zsh/zprof

# add the argument to $PATH only if it's not already present
function extend_path() {
  [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

# add ~/bin and ~/.local/bin to $PATH if they exist
extend_path "$HOME/bin"
extend_path "$HOME/.local/bin"

# brew installs some binaries like openvpn to /usr/local/sbin
[[ $OSTYPE == darwin* ]] && extend_path "/usr/local/sbin"


if type brew &> /dev/null; then
  # Enable brew installed completions
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

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
  # zgen prezto prompt
  zgen prezto syntax-highlighting
  # zgen prezto git
  zgen prezto editor key-bindings 'vi'
  zgen prezto '*:*' case-sensitive 'no'
  zgen prezto '*:*' color 'yes'
  zgen prezto 'module:editor' dot-expansion 'no'
  zgen prezto 'module:editor' key-bindings 'vi'
  zgen prezto 'module:syntax-highlighting' highlighters 'main' 'brackets' 'pattern' 'cursor'
  zgen prezto 'module:terminal' auto-title 'yes'
  # zgen prezto prompt theme 'pure'
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

# add GoLand to the path if it exists
extend_path "/Applications/GoLand.app/Contents/MacOS"

# prefer GNU sed b/c BSD sed doesn't handle whitespace the same
if which gsed > /dev/null; then extend_path "/usr/local/opt/gnu-sed/libexec/gnubin"; fi

# rust (b/c rustup doesn't play well with the rust brew formulae)
if ! which rustup > /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# set GOBIN
export GOBIN="$(go env GOPATH)/bin"
extend_path "$(go env GOBIN)"


# kubernetes
if which kubectl > /dev/null; then
  alias k=kubectl
  export KUBECONFIG="$HOME/.kube/config"
fi

# acorn
if which acorn > /dev/null; then
  alias a=acorn
  source <(acorn completion zsh)
fi

# add mysql-client to the path if it exists
extend_path "/usr/local/opt/mysql-client/bin"

# enable direnv (directory-specific environment variables) 
eval "$(direnv hook zsh)"

# enable starship (prompt styling)
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nick/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nick/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nick/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nick/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
