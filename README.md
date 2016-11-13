# My accummulated Dotfiles (currently for Ubuntu):
---
This details process to get dev environment up and going quickly. 
Please feel free to take whatever pleases you, it's what I've done,
and what others do to get these things tuned to one's liking. 

## Git
* $ sudo apt-get update
* $ sudo apt-get install git

## Clone repo
$ git clone https://github.com/blkwtkns/dotfiles.git ~/.dotblk

## Zsh
* $ sudo apt-get install zsh
Then install Prezto: https://github.com/sorin-ionescu/prezto 
Remember to change shell: chsh -s /usr/bin/zsh (or chsh -s /bin/zsh)
Then logout of desktop session and log back in!

## Curl
* $ sudo apt-get install curl 

## NVM and Node
* $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | zsh 
* $ nvm install node

#### The following should be automatically put in .zshrc | .bashrc to load nvm:
$ export NVM_DIR="/home/blahque/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

#####If colors funky:
$ if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
  fi

## Neovim Installation (Ubuntu):
The HQ suggests a PPA that contains the development version:
https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

* $ sudo apt-get install python-dev python-pip python3-dev python3-pip
* $ sudo apt-get install software-properties-common
* $ sudo add-apt-repository ppa:neovim-ppa/unstable
* $ sudo apt-get update
* $ sudo apt-get install neovim

## Py stuff
* $ pip install --user neovim
* $ pip install --upgrade neovim
* $ pip2 install --upgrade neovim
* $ pip3 install --upgrade neovim
* $ pip install --upgrade pip

### If you want to build Neovim from source, here are the steps:
Visit https://github.com/neovim/neovim and find the tagged version you need.
Download the zip, uncompress it, and enter the project folder.

#### Install the dependencies:
NB (This might be preferable, neomake wouldn't work until 
I apt-get installed autoconf and automake)

* $ sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++

#### Starting building
* $ make cmake
* $ make test
* $ sudo make install

#### On all platforms (update this package frequently):
* $ sudo pip2/pip3 install neovim -U

## Shell script
I think at this point the symlinks can be made, which 
I made a shell script to shorten the process, although there are 
only a few links haha, but I expect this to keep growing 
in symlinks and functionality.

#### Go to home folder: 
* $ cd ~ (the first command in script changes directory to $HOME as insurance)
#### Run sh script: 
* $ zsh scripts.sh (or bash scripts.sh)


## For Neomake (if Neovim not built from source):
* $ sudo apt-get install build essentials
* $ sudo apt-get install make
* $ sudo apt-get install autoconf automake

## Beautifier
* $ npm i -g js-beautify

## Lint
* $ npm i -g eslint
* $ npm i -g jscs

## clipboard: 
* $ sudo apt-get install xclip

## Tmux
* $ sudo apt-get install tmux 
See: https://tomordonez.com/install-tmux-ubuntu/

# Misc

## Shared folder mounting via VirtualBox
* $ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) ~/Downloads ~/host

## Links:
https://github.com/greg-js/dotfiles
wikimatze.de/better-zsh-with-prezto

## TODOS
Work on cross platform config conditions and sh scripting

## Issues
* Eslint not working with current config, use jscs

## Thanks
Many to give, links to repos and blogs coming soon
