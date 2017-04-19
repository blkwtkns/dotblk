#!/bin/zsh --no-rcs
# from cbarrick's awesome prompt theme
source "${0:h}/git_prompt.zsh"
source "${0:h}/blaenk.zsh"

function prompt_blaquer_help {
  cat<<'EOF'
Usage: prompt blaquer [<prompt-color=green> [<info-color=blue> [<error-color=red>]]]
EOF
}

function prompt_blaquer_setup {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info
  # Workaround for zsh 5.2 release 
  autoload +X VCS_INFO_nvcsformats
  functions[VCS_INFO_nvcsformats]=${functions[VCS_INFO_nvcsformats]/local -a msgs/}

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
  zstyle ':vcs_info:*:blaquer:*' formats \
    "${project}:${branch} ${vcs_path}"

  ## Determines the value during a merge, rebase, etc
  zstyle ':vcs_info:*:blaquer:*' actionformats \
    "${project}:${branch}${action} ${vcs_path}"

  ## Determines the value when outside of version control
  zstyle ':vcs_info:*:blaquer:*' nvcsformats \
    "${non_vcs_path}"

  # To avoid conflicts with other uses of vcs_info, we reset the $PROMPT for every command
  function set_prompt {
    vcs_info blaquer
    PROMPT="${vcs_info_msg_0_} ${vim_mode}$(p_arrow) "
    RPROMPT='$(git_prompt_string)'
  }
  add-zsh-hook precmd set_prompt
}

prompt_blaquer_setup "$@"

