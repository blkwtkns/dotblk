default: install-packages add-repositories enable-services link-config set-shell install-nvm set-node install-rust install-ripgrep show-notes

install-packages:
	sudo pacman -Sy yaourt
	yaourt -S --needed --noconfirm `cat packages.txt`

add-repositories:
	cat repositories.txt | sudo tee -a /etc/pacman.conf

enable-services:
	sudo systemctl enable lightdm NetworkManager tlp tlp-sleep
	sudo systemctl disable systemd-rfkill
	sudo tlp start

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which zsh`

install-nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

set-node:
	nvm install node

install-rust:
	curl -sSf https://static.rust-lang.org/rustup.sh | sh

install-ripgrep:
	cargo install ripgrep

show-notes:
	cat ./post-install.txt
