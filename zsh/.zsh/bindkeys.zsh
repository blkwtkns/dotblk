# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey -v

# ❯❯❯
# vim_ins_mode="%B%F{1}❯%F{3}❯%F{2}❯%f%b"
# vim_cmd_mode="%B%F{2}❮%F{3}❮%F{1}❮%f%b"
vim_ins_mode="%B%F{1}>%F{3}>%F{2}>%f%b"
vim_cmd_mode="%B%F{2}<%F{3}<%F{1}<%f%b"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select
zle -N edit-command-line

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle &&  zle -R
}
