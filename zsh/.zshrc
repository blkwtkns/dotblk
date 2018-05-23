source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completions.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/history.zsh
source ~/.zsh/functions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SISUAWS='ubuntu@ec2-54-67-104-251.us-west-1.compute.amazonaws.com'
export YOBOAWS='bitnami@ec2-54-241-229-177.us-west-1.compute.amazonaws.com'
export MW_SISU_AWS='ubuntu@ec2-18-233-170-132.compute-1.amazonaws.com'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
