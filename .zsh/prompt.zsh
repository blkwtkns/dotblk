autoload -Uz promptinit
promptinit

# setopt PROMPT_SUBST     # allow funky stuff in prompt
# color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

# ${vim_mode}
RPROMPT='$(git_prompt_string)'
source "${0:h}/prompts/git_prompt.zsh"

PROMPT='
%F{blue}λ %f%{$fg[$color]%}%n%{$reset_color%} $(p_colored_path)$(p_hostname)$(p_envs)$(p_exit_code)
${vim_mode}$(p_arrow) '
# PS2='$(p_continuation) $(p_arrow) '
source "${0:h}/prompts/blaenk.zsh"

# source "${0:h}/prompts/prompt_cbarrick_setup.zsh"
# prompt cbarrick
