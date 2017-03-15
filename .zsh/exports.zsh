# Setup terminal, and turn on colors
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
# export TERM=screen-256color
# export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
# export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
# export LC_ALL=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8
# export LANG=en_US.UTF-8

# CTAG
export LC_COLLATE=C 

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Virtual Environment Stuff
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Projects/django
# source /usr/local/bin/virtualenvwrapper.sh

# if nvim
# export EDITOR='/usr/bin/nvim'
# export VISUAL='/usr/bin/nvim'

# if cargo
# export PATH=$HOME/.local/bin:$PATH
# export PATH=$HOME/.cargo/bin:$PATH

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)
