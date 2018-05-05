default: link-config set-shell install-nvm install-yarn install-apex sync-neovim sync-tmux show-notes

link-config:
	stow -t $$HOME -R `ls -d */`

set-shell:
	chsh -s `which zsh`

install-nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | $$SHELL

install-apex:
	curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sudo $$SHELL

install-yarn:
	curl -o- -L https://yarnpkg.com/install.sh | $$SHELL

sync-neovim:
	$$SHELL $$HOME/.config/nvim/sync.sh

sync-tmux:
	$$SHELL $$HOME/.tmux/sync.sh

show-notes:
	cat ./post-install.txt
