# Ubuntu post-install:
### This details process to get dev environment up and going quickly. 
### Please feel free to take whatever pleases you, it's what I've done,
### and what others do to get these things tuned to one's liking. 

## Git
### $ sudo apt-get update
### $ sudo apt-get install git

## Zsh
### $ sudo apt-get install zsh
### Then install Prezto: https://github.com/sorin-ionescu/prezto 
### Remember to change shell: chsh -s /usr/bin/zsh (or chsh -s /bin/zsh)

## Curl
### $ sudo apt-get install curl 

## NVM and Node
### $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | zsh 
### $ nvm install node

### Put in .zshrc:
### export NVM_DIR="/home/blahque/.nvm"
### [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### If colors funky:
### if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
###    export TERM=xterm-256color
### fi


## Neovim Installation (Ubuntu):
### The HQ suggests a PPA that contains the development version:
####   https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

### $ sudo add-apt-repository -y ppa:neovim-ppa/unstable
### $ sudo apt-get update && sudo apt-get install -y neovim
### $ pip install --user neovim

### $ mkdir -p ~/.config/nvim
### $ ln -s ~/.vimrc ~/.config/nvim/init.vim

### If you want to build Neovim from source, here are the steps:
###  1) Visit https://github.com/neovim/neovim and find the tagged version you need.
###    Download the zip, uncompress it, and enter the project folder.
###  2) Install the dependencies:
###    NB (Blake: This might be preferable, neomake wouldn't work until I apt-get installed autoconf and automake)
###    $ sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++
###  3) Starting building
###    $ make cmake
###    $ make test
###    $ sudo make install
### On all platforms (update this package frequently):
###    $ sudo pip2/pip3 install neovim -U

## Shell script
### I think at this point the symlinks can be made, which I made a sh script
### to shorten the process (although there are only a few links haha, but I expect  
### this to keep growing in symlinks and functionality).

### Go to home folder, $ cd ~
### Run sh script, $ sh links.sh


## Py stuff
### $ sudo apt-get install python-dev python-pip python3-dev python3-pip
### $ sudo pip install --upgrade neovim
### $ pip2 install --upgrade neovim
### $ pip3 install --upgrade neovim
### $ pip install --upgrade pip

## For Neomake (if Neovim not built from source):
### $ sudo apt-get install build essentials
### $ sudo apt-get install make
### $ sudo apt-get install autoconf automake

## Beautifier
### $ npm i -g js-beautify

## Lint
### $ npm i -g eslint
### $ npm i -g jscs

## clipboard: 
### $ sudo apt-get install xclip

## Tmux
### $ sudo apt-get install tmux
### Links: 
### https://tomordonez.com/install-tmux-ubuntu/

# Misc

## Shared folder mounting via VirtualBox
### $ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) ~/Downloads ~/host

## Links:
### https://github.com/greg-js/dotfiles

# TODOS
## Work on cross platform config conditions and sh scripting
