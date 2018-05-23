# Setup terminal, and turn on colors
# export TERM=xterm-256color
# [ -n "$TMUX" ] && export TERM=screen-256color

if [[ -n ${TMUX} ]]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

if ! pgrep -x "i3" > /dev/null
then
  # launch tmux if not already in a session
  if [ $TERM != "screen-256color" ] && [ $TERM != "screen" ]; then
    if tmux has-session -t main 2>/dev/null; then
      tmux attach -t main
    else
      tmux new -s main
    fi
  fi
fi

# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
# fi

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

# CTAG
export LC_COLLATE=C 

# Virtual Environment Stuff
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Projects/django
# source /usr/local/bin/virtualenvwrapper.sh

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# neovim specifics
if [ -x "$(command -v nvim)" ]; then
  # Make vimrc var
  export MYVIMRC='.config/nvim/init.vim'
  # Make neovim default
  export EDITOR='/usr/bin/nvim'
  export VISUAL='/usr/bin/nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
  export MYVIMRC='.vimrc'
fi


# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
# export LC_ALL=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8
# export LANG=en_US.UTF-8

# Paths
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

# if cargo present add to path
# if [ -x "$(command -v cargo)" ]; then
  # Set up local bins
  export PATH=$HOME/.local/bin:$PATH
  export PATH=$HOME/.cargo/bin:$PATH
  export PATH=$HOME/go/bin:$PATH
# fi

# add ~/bin to path if it exists
# [ -d $HOME/bin ] && export PATH=${PATH}:${HOME}/bin


# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

# cursor shape
# echo -ne '\e[5 q'

# nvm
# if [ -x "$(command -v nvm)" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# fi

# fzf
if [ -x "$(command -v rg)" ]; then
    # FZF and Ripgrep ish --> move into .zshrc
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
    export FZF_CTRL_T_OPTS="--preview '(coderay {} || cat {}) | head -200' --preview-window right:70%:hidden:wrap --bind '?:toggle-preview' --bind 'alt-j:preview-down,alt-k:preview-up'"
    # command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'
    command -v tree > /dev/null && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --preview-window right:70%:hidden:wrap --bind '?:toggle-preview' --bind 'alt-j:preview-down,alt-k:preview-up'"
fi

# Open a new window in this term's cwd
nwZle() { zle push-line; BUFFER="setsid urxvt"; zle accept-line; }
zle -N nwZle
# CTRL+n
bindkey '^n' nwZle

TMPPREFIX="${TMPDIR%/}/zsh"
