#!/bin/zsh --no-rcs
# cbarrick's awesome prompt theme

function prompt_cbarrick_help {
  cat<<'EOF'
Usage: prompt cbarrick [<prompt-color=green> [<info-color=blue> [<error-color=red>]]]
EOF
}

function prompt_cbarrick_setup {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  # The colors
  prompt_csb_color_main=${1:-'green'}
  prompt_csb_color_info=${2:-'blue'}
  prompt_csb_color_err=${3:-'red'}

  # These variables are composed into the $vcs_info_msg_0_ environment variable
  local project="%F{${prompt_csb_color_main}}%r%f"
  local branch="%F{${prompt_csb_color_main}}%b%f"
  local action="%F{${prompt_csb_color_info}}(%a)%f"
  local vcs_path="%S"       # The path relative to the root of the project
  local non_vcs_path="%1~"  # The name of the current directory

  # Configure vcs_info
  # These options determine the value of `$vcs_info_msg_0_` after running `vcs_info cbarrick`.
  # The prompt is reset to `$vcs_info_msg_0_` after every command--these options set the prompt.

  ## Determines the value when inside a version controled directory
  zstyle ':vcs_info:*:cbarrick:*' formats \
    "${project}:${branch} ${vcs_path}"

  ## Determines the value during a merge, rebase, etc
  zstyle ':vcs_info:*:cbarrick:*' actionformats \
    "${project}:${branch}${action} ${vcs_path}"

  ## Determines the value when outside of version control
  zstyle ':vcs_info:*:cbarrick:*' nvcsformats \
    "${non_vcs_path}"

  # To avoid conflicts with other uses of vcs_info, we reset the $PROMPT for every command
  function set_prompt {
    local main="%(?.%(1j.%F{${prompt_csb_color_info}}[:%j].).%F{${prompt_csb_color_err}}[%?%(1j.:%j.)])%#%f "
    vcs_info cbarrick
    PROMPT="${vcs_info_msg_0_} ${main}"
    RPROMPT=${SSH_CONNECTION:+ %m}
  }
  add-zsh-hook precmd set_prompt
}

prompt_cbarrick_setup "$@"
