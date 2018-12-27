# -------------------------------------------------------------------
# use nocorrect alias to prevent auto correct from "fixing" these
# -------------------------------------------------------------------
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias ack='nocorrect ack'
alias allgroups='cut -d: -f1 /etc/group | sort'
alias b='${(z)BROWSER}'
alias bower='noglob bower'
alias cd='nocorrect cd'
alias cdg='cd $(git rev-parse --show-toplevel)'
alias cdf='cd "$(pfd)"'
alias cp='nocorrect cp -i'
alias d='dirs -v'
alias df='df -kh'

alias du='du -kh'
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias ebuild='nocorrect ebuild'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'

# -------------------------------------------------------------------
# Vim
# -------------------------------------------------------------------
if [ -x "$(command -v nvim)" ]; then
  # open neovim on vi and vim commands
  alias vim='nvim'
  alias vi='nvim'
  # convenience aliases for editing configs
  alias ev='nvim ~/.config/nvim/init.vim ~/.config/nvim/configs/*'
  alias et='nvim ~/.tmux.conf'
  alias ez='nvim ~/.zsh/**/*.zsh'
  alias visesh='nvim -c RestoreSesh'
  # if vim-dirvish/netrw toggle config is setup
  alias vimrw='nvim --cmd "let g:stop_netrw=0"'
  alias vfcs='nvim `git diff-tree --no-commit-id --name-only -r "$(fcs)"`'
  alias vshow="git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | nvim -R -c 'set hidden nowrap keywordprg=:enew\ \|\ terminal\ \git\ --no-pager\ show | nnoremap q :bd!<cr>' -"
else
  alias vi='vim'
  alias ev='vim ~/.vimrc'
  alias et='vim ~/.tmux.conf'
  alias ez='vim ~/.zsh/**/*.zsh'
  alias visesh='vim -c RestoreSesh'
  # if vim-dirvish/netrw toggle config is setup
  alias vimrw='vim --cmd "let g:stop_netrw=0"'
  # adjust and make a fzf function that lets user choose commit and
  # opens all files that were changed in that commit
  alias vfcs='vim `git diff-tree --no-commit-id --name-only -r "$(fcs)"`'
  # opens list of commits and enables viewing of changes with press of shift + k
  alias vshow=`git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | vim -R -c 'set filetype=git nowrap' -`
fi

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
source "${0:h}/git/alias.zsh"
# -------------------------------------------------------------------
# System
# -------------------------------------------------------------------
alias heroku='nocorrect heroku'
alias history='noglob history'
alias history-stat='history 0 | awk ''{print $2}'' | sort | uniq -c | sort -n -r | head'
alias http-serve='python -m SimpleHTTPServer'
alias l='ls -A --color'
alias la='ll -A --color'
alias lc='lt -c --color'
alias lk='ll -Sr --color'
alias ll='ls -lh --color'
alias lm='la | "$PAGER"'
alias ln='nocorrect ln -i'
alias locate='noglob locate'
alias lr='ll -R'
alias lt='ll -tr'
alias lu='lt -u'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir -p'
alias mv='nocorrect mv -i'
alias mysql='nocorrect mysql'
alias o=open
alias p='${(z)PAGER}'
alias pbc=pbcopy
alias pbp=pbpaste
# alias po=popd
# alias pu=pushd
# alias pushdf='pushd "$(pfd)"'
alias ill='kill -KILL'
alias rake='noglob rake'
alias rm='nocorrect rm -i'
alias rsync='noglob rsync'
alias run-help=man
alias scp='noglob scp'
alias sftp='noglob sftp'
alias sl=ls

# -------------------------------------------------------------------
# Tmux
# -------------------------------------------------------------------
alias ta='tmux attach -t'
alias tkill='tmux kill-session -t'
alias tls='tmux ls'
alias tmux='tmux -2'
alias tnew='tmux new -s'
alias topc='top -o cpu'
alias topm='top -o vsize'
alias type='type -a'
alias which-command=whence

# -------------------------------------------------------------------
# Haskell
# -------------------------------------------------------------------
if [ -x "$(command -v stack)" ]; then
  alias ghc='stack exec -- ghc'
  alias ghci='stack exec -- ghci'
fi


# -------------------------------------------------------------------
# Node
# -------------------------------------------------------------------
# vim bindings
alias nodevim='node ~/node-rdln/.readline.config.js'

# update node with nvm
alias nodeup='nvm install node --reinstall-packages-from=node'

# update yarn
alias yarnup='curl --compressed -o- -L https://yarnpkg.com/install.sh | bash'

# -------------------------------------------------------------------
# Docker
# -------------------------------------------------------------------
if [ -x "$(command -v docker)" ]; then
  # Automatize search for Docker container
  function docks() {
    docker ps | grep "$1" | cut -d ' ' -f1
  }
  #
  function inspectcontainer() {
    docker exec -it `docks $1` sh
  }

  alias dockkilla='docker kill $(docker ps -q)'
  alias dockrm='docker rm $(docker ps -a -q)'
  alias dockrmi='docker rmi $(docker images -q)'
  alias dockspec=inspectcontainer
fi

# Show all groups (sorted)
alias allgroups='cut -d: -f1 /etc/group | sort'

# -------------------------------------------------------------------
# Manjaro specific
# -------------------------------------------------------------------
if [[ -f /etc/manjaro-release ]]; then
  alias con='$EDITOR $HOME/.i3/config'
  alias comp='$EDITOR $HOME/.config/compton.conf'
  alias fixit='sudo rm -f /var/lib/pacman/db.lck'
  alias inst='sudo pacman -S'
  # alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  # alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
  alias mirrors='sudo pacman-mirrors -g'
  alias printer='system-config-printer'
  alias update='yaourt -Syua'
fi
