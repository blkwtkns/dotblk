autoload -Uz promptinit
promptinit

# setopt PROMPT_SUBST     # allow funky stuff in prompt
# color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;

# export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "
export SPROMPT='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '

source "${0:h}/prompts/blaenk.zsh"
# λ
PROMPT='
%F{yellow}λ%f %{$fg[$color]%}%n%{$reset_color%} ${vcs_info_msg_0_} $(p_hostname) $(p_envs) $(p_exit_code)
${vim_mode} '
source "${0:h}/prompts/git_prompt.zsh"
RPROMPT='$(git_prompt_string)'
# source "${0:h}/prompts/prompt_blaquer_setup.zsh"
# prompt blaquer
