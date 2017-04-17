autoload -Uz promptinit
promptinit

# setopt PROMPT_SUBST     # allow funky stuff in prompt
# color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;

RPROMPT='$(git_prompt_string)${vim_mode}'

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

source "${0:h}/prompts/git_prompt.zsh"
# PROMPT set in blaenk.zsh
source "${0:h}/prompts/blaenk.zsh"
