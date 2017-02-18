# My accummulated Dotfiles (currently for Ubuntu):
---
This details process to get dev environment up and going quickly. 
Please feel free to take whatever pleases you, it's what I've done,
and what others do to get these things tuned to one's liking. 

### Git
* $ sudo apt-get update
* $ sudo apt-get install git

### Clone repo
$ git clone https://github.com/blkwtkns/dotfiles.git ~/.you_choose_folder_name (I suggest to prefix '.')

### Zsh
* $ sudo apt-get install zsh
* Then install Prezto: https://github.com/sorin-ionescu/prezto 
* Remember to change shell: chsh -s /usr/bin/zsh (or chsh -s /bin/zsh)
Then logout of desktop session and log back in!

### Curl
* $ sudo apt-get install curl 

### NVM and Node
* $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | zsh 
* $ nvm install node

#### The following should be automatically put in .zshrc | .bashrc to load nvm:
> $ export NVM_DIR="/home/blahque/.nvm"
> [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

##### If colors funky:
>$ if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
>    export TERM=xterm-256color
>  fi

### Neovim Installation (Ubuntu):
The HQ suggests a PPA that contains the development version:
https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu

* $ sudo apt-get install python-dev python-pip python3-dev python3-pip
* $ sudo apt-get install software-properties-common
* $ sudo add-apt-repository ppa:neovim-ppa/unstable
* $ sudo apt-get update
* $ sudo apt-get install neovim

### Py stuff
* $ pip install --user neovim
* $ pip install --upgrade neovim
* $ pip2 install --upgrade neovim
* $ pip3 install --upgrade neovim
* $ pip install --upgrade pip

### If you want to build Neovim from source, here are the steps:
Visit https://github.com/neovim/neovim and find the tagged version you need.
Download the zip, uncompress it, and enter the project folder.

#### Install the dependencies:
NB: This might be preferable, neomake wouldn't work until 
I apt-get installed autoconf and automake

* $ sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++

#### Starting building
* $ make cmake
* $ make test
* $ sudo make install

#### On all platforms (update this package frequently):
* $ sudo pip2/pip3 install neovim -U

### Shell script
Changes to home directory, establishes symlinks, and
assigns neovim (nvim) to global EDITOR and VISUAL shell
global variables. I keep working on making this script
automate as much as possible, but with required passwords
and possible errors, I think most of this should be done
manually. If you're not comfortable with running scripts, 
just use the file as reference.

#### Go to home folder: 
* $ cd ~ (the first command in script changes directory to $HOME as insurance)
#### Run sh script: 
* $ zsh scripts.sh (or bash scripts.sh)

### For Neomake (if Neovim not built from source):
* $ sudo apt-get install build essentials
* $ sudo apt-get install make
* $ sudo apt-get install autoconf automake

### Beautifier
* $ npm i -g js-beautify

### Lint
* $ npm i -g eslint
* $ npm i -g jscs

### clipboard: 
* $ sudo apt-get install xclip

### Tmux
* $ sudo apt-get install tmux 
* See: https://tomordonez.com/install-tmux-ubuntu/
* After installing tmux and running script, do the following to enable tmux plugin management
* $ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
* :source-file ~/.tmux.conf

### Tags
* $ sudo apt-get install exuberant-ctags
* http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
* http://vi.stackexchange.com/questions/2944/can-i-load-different-tags-per-project
* http://vim.wikia.com/wiki/Browsing_programs_with_tags

# Misc

### Capslock to Ctrl
$ sudo nvim /etc/default/keyboard 
then change XKBOPTIONS="ctrl:nocaps"
then
$ setxkbmap -layout us -option ctrl:nocaps

### Shared folder mounting via VirtualBox
* $ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) ~/folder_from_non_virtual_machine ~/name_of_folder_on_virtual_machine

### Links:
* https://github.com/greg-js/dotfiles
* wikimatze.de/better-zsh-with-prezto
* Docker installation (ubuntu): https://docs.docker.com/engine/installation/linux/ubuntu/

### Haskell setup: 
* http://www.stephendiehl.com/posts/vim_2016.html
* http://lonelyproton.com/posts/26-getting-started-with-haskell-development-3

### Linux Links:
* https://github.com/thezerobit/asus-zenbook-ux305fa
* http://askubuntu.com/questions/715306/xbacklight-no-outputs-have-backlight-property-no-sys-class-backlight-folder
* https://help.ubuntu.com/community/AsusZenbook#Power_Saving_Optimizations

### Tips:
* install rtv ($ pip install --user rtv)
* read rtv docs
* install urlview...
* $ sudo apt-get update
  $ sudo apt-get install urlview
  $ export RTV_URLVIEWER=urlview

### TODOS
* Work on cross platform config conditions and sh scripting(needs testing)
* Separate npm script for global installs
* Added workflow and scripts for AWS-cli and Apex
* Work on plug-less vimrc for easy use anywhere
* Finish Dockerfile for portable dev environment (DON'T USE YET!!)

### Issues
* Eslint not working with current config, use jscs

### Thanks
Many to give, links to repos and blogs coming soon
