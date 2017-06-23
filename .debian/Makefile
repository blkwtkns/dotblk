default: install-packages link-config install-rust make-lemonade show-notes

install-packages:
	# change for debian
	sudo apt-get -y install `cat packages.txt`

install-rust:
	curl https://sh.rustup.rs -sSf | sh

link-config:
	stow --restow `ls -d */`

make-lemonade:
	mkdir tmp; cd tmp
	git clone  https://github.com/LemonBoy/bar.git
	sudo apt-get install build-essential checkinstall
	sudo apt-get install libxcb1-dev libxcb-xinerama0-dev libxcb-randr0-dev
	make
	checkinstall -D make install

show-notes:
	cat ./post-install.txt
