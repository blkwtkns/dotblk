default: link-config set-shell install-nvm sync-neovim sync-tmux show-notes

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which zsh`

install-nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

sync-neovim:
	./neovim/.config/nvim/sync.sh

sync-tmux:
	./tmux/.tmux/sync.sh

show-notes:
	cat ./post-install.txt
