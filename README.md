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
* Prezto: https://github.com/sorin-ionescu/prezto 
* Remember to change shell: chsh -s /usr/bin/zsh (or chsh -s /bin/zsh)
Then logout of desktop session and log back in!

##### If colors funky:
>$ if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
>    export TERM=xterm-256color
>  fi

### Neovim (Ubuntu):
* https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
* https://github.com/neovim/neovim

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
* $ . ~/path/to/dotfile/directory/scripts.sh

### Tmux
* https://tomordonez.com/install-tmux-ubuntu/

### Haskell setup: 
* http://www.stephendiehl.com/posts/vim_2016.html
* http://lonelyproton.com/posts/26-getting-started-with-haskell-development-3

### Rust
* http://doc.crates.io/index.html

### Ripgrep
* http://blog.burntsushi.net/ripgrep/

### Linux Links:
* https://github.com/thezerobit/asus-zenbook-ux305fa
* http://askubuntu.com/questions/715306/xbacklight-no-outputs-have-backlight-property-no-sys-class-backlight-folder
* https://help.ubuntu.com/community/AsusZenbook#Power_Saving_Optimizations

### Tags
* http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
* http://vi.stackexchange.com/questions/2944/can-i-load-different-tags-per-project
* http://vim.wikia.com/wiki/Browsing_programs_with_tags

### Capslock to Ctrl
$ sudo nvim /etc/default/keyboard
then change XKBOPTIONS="ctrl:nocaps"
then
$ setxkbmap -layout us -option ctrl:nocaps

### Shared folder mounting via VirtualBox
* $ sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) ~/folder_from_non_virtual_machine ~/name_of_folder_on_virtual_machine

### Other Links:
* https://github.com/greg-js/dotfiles
* wikimatze.de/better-zsh-with-prezto
* Docker installation (ubuntu): https://docs.docker.com/engine/installation/linux/ubuntu/
* (linux) https://github.com/raelgc/scudcloud/

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
* Default to gnome terminal (no, urxvt is direction, soon)

### Thanks
Many thanks to effort all those who crafted these awesome tools and others 
who took time to document their environments and preferences. I'm definitely
standing on the shoulders of giants.
