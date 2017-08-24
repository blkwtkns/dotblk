default: link-config set-shell install-nvm sync-neovim sync-tmux show-notes install-powerline

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which zsh`

install-nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | $SHELL

sync-neovim:
	$SHELL $HOME/.config/nvim/sync.sh

sync-tmux:
	$SHELL $HOME/.tmux/sync.sh

install-powerline:
	git clone https://github.com/powerline/fonts.git && cd fonts | ./install.sh

show-notes:
	cat ./post-install.txt
