# prompt
# setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload +X VCS_INFO_nvcsformats
functions[VCS_INFO_nvcsformats]=${functions[VCS_INFO_nvcsformats]/local -a msgs/}

# The colors
prompt_csb_color_main=${1:-'green'}
prompt_csb_color_info=${2:-'blue'}
prompt_csb_color_err=${3:-'red'}

# These variables are composed into the $vcs_info_msg_0_ environment variable
project="%F{${prompt_csb_color_main}}%r%f"
branch="%F{${prompt_csb_color_main}}%b%f"
action="%F{${prompt_csb_color_info}}(%a)%f"
vcs_path="%S"       # The path relative to the root of the project
non_vcs_path="%1~"  # The name of the current directory

zstyle ':vcs_info:*:blaquer:*' formats \
  "${project} ${vcs_path}"

zstyle ':vcs_info:*:blaquer:*' actionformats \
  "${project}:${action} ${vcs_path}"

zstyle ':vcs_info:*:blaquer:*' nvcsformats \
  "${non_vcs_path}"

# mode-aware arrow
function p_arrow {
  if [[ $KEYMAP = "vicmd" ]]; then
    echo "%F{magenta}❯❯%f"
  else
    echo "%F{cyan}❯❯%f"
  fi
}

# colored path
function p_colored_path {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

# git info
function p_vcs {
  vcs_info
  echo $vcs_info_msg_0_
}

# environments:
#  - ssh
#  - virtualenv
#  - cabal sandbox

export VIRTUAL_ENV_DISABLE_PROMPT=1

function p_hostname {
  [[ -n $SSH_CLIENT || -n $SHOW_HOSTNAME_IN_PROMPT ]] && echo " %F{cyan}@%f %U%m%u"
}

function p_envs {
  # check for cabal sandbox in parent directories, recursively
  local cabal
  cabal=( (../)#cabal.sandbox.config(N) )

  local envs
  (( $#cabal ))         && envs += "H"
  [[ -n $VIRTUAL_ENV ]] && envs += "P"

  [[ -n $envs ]] && echo " %F{green}[%f$envs%F{green}]%f"
}

function p_exit_code {
  echo "%(?..%B%F{red}!%f%b )"
}

# PROMPT='
# %F{blue}λ%f %{$fg[$color]%}%n%{$reset_color%} $(p_colored_path)$(p_hostname)$(p_envs) $(p_exit_code)
# ${vim_mode} '

function p_continuation {
  echo "%1(_.%_.contd)"
}

# PS2='$(p_continuation) $(p_arrow) '

function set_prompt {
  vcs_info blaquer
}
add-zsh-hook precmd set_prompt
