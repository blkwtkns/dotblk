# PROMPT='%{$fg[$prompt_color]%}%n@%m%{$reset_color%} %~
# %{${fg[yellow]}%}%# '

autoload -Uz promptinit
promptinit

prompt adam2

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "
