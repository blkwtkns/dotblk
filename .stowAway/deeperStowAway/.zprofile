#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

# neovim specifics
if [ -x "$(command -v nvim)" ]; then

  # Make vimrc var
  export MYVIMRC='.config/nvim/init.vim'

  # Make neovim default
  export EDITOR='/usr/bin/nvim'
  export VISUAL='/usr/bin/nvim'

  # open neovim on vi and vim commands
  alias vim='nvim'
  alias vi='nvim'

  # convenience aliases for editing configs
  alias ev='nvim ~/.config/nvim/init.vim ~/.config/nvim/configs/*'
  alias et='nvim ~/.tmux.conf'
  alias ez='nvim ~/.zprofile ~/.zshrc'
  alias visesh='nvim -c RestoreSession'
fi

# if cargo present add to path
if [ -x "$(command -v cargo)" ]; then
  # Set up local bins
  export PATH=$HOME/.local/bin:$PATH
  export PATH=$HOME/.cargo/bin:$PATH
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

# cursor shape
# echo -ne '\e[5 q'

# Aliases

# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# Haskell
if [ -x "$(command -v stack)" ]; then
  alias ghc='stack exec -- ghc'
  alias ghci='stack exec -- ghci'
fi

# git alias (should move to gitconfig)
alias gflog='git reflog | grep -A1 pull | head -2'

# Docker
if [ -x "$(command -v docker)" ]; then
  # Kill all running Docker containers
  alias dock-killa='docker kill $(docker ps -q)'

  # Remove all Docker containers
  alias dock-rm='docker rm $(docker ps -a -q)'

  # Remove all Docker images
  alias dock-rmi='docker rmi $(docker images -q)'

  # Automatize search for Docker container
  function docks() {
    docker ps | grep "$1" | cut -d ' ' -f1
  }
  #
  function inspectcontainer() {
    docker exec -it `docks $1` sh
  }
  #
  alias dockspec=inspectcontainer
fi

# Show all groups (sorted)
alias allgroups='cut -d: -f1 /etc/group | sort'

# nvm
if [ -x "$(command -v nvm)" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# fzf
if [ -x "$(command -v rg)" ]; then
  if [ -x "$(command -v fzf)" ]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # FZF and Ripgrep ish --> move into .zshrc
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
  fi
fi


TMPPREFIX="${TMPDIR%/}/zsh"
