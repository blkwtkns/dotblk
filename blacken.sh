#!/bin/bash

# Determine OS
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# Ensure that script is being run in home directory
cd $HOME

# Install the good stuff - OS dependent
if [[ $platform == 'linux' ]]; then
  sudo apt-get update
  sudo apt-get upgrade

  sudo apt-get install zsh
  # chsh -s /usr/bin/zsh

  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  sudo apt-get install curl

  sudo apt-get install build essentials
  sudo apt-get install make
  sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++
  sudo apt-get install python-dev python-pip python3-dev python3-pip
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim
  sudo pip2 install neovim -U
  sudo pip3 install neovim -U

  sudo apt-get install xclip
  sudo apt-get install tmux

elif [[ $platform == 'mac' ]]; then
  xcode-select –install
  /usr/bin/ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”
  brew doctor
  brew install caskroom/cask/brew-cask

  brew install zsh
  # sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
  brew link curl --force
  brew install tmux
fi

# Might be redundant but shouldn't hurt
pip install --user neovim
pip install --user --upgrade neovim
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
pip install --upgrade pip

# Download tmux plugin manager then source config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf

# tags for mac?

# Install nvm and newest node version
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
nvm install node

# Install Cargo
curl -sSf https://static.rust-lang.org/rustup.sh | sh

# Install ripgrep
cargo install ripgrep

# Create variable to find path to script
dotDir=$(dirname "$(readlink -f "$0")")
# echo $dotDir

# symlinks
# ln -sv $dotDir/nvim $HOME/.config
# ln -sv $dotDir/.eslintrc
# ln -sv $dotDir/.gitconfig
# ln -sv $dotDir/.jscsrc
# ln -sv $dotDir/.tmux.conf
# ln -sv $dotDir/jsdev.conf $HOME/.tmux/jsdev.conf
# ln -sf $dotDir/.zpreztorc $HOME/.zpreztorc
# ln -sf $dotDir/.zprofile $HOME/.zprofile

# try out copy instead so that dotfile repo isn't mutating from
# local configurations
cp $dotDir/nvim $HOME/.config
cp $dotDir/.eslintrc $HOME/.eslintrc
cp $dotDir/.gitconfig $HOME/.gitconfig
cp $dotDir/.jscsrc $HOME/.jscsrc
cp $dotDir/.tmux.conf $HOME/.tmux.conf
cp $dotDir/jsdev.conf $HOME/.tmux/jsdev.conf
cp $dotDir/.zpreztorc $HOME/.zpreztorc
cp $dotDir/.zprofile $HOME/.zprofile
cp $dotDir/.global_ignore $HOME/.global_ignore

git config --global core.excludesfile $HOME/.global_ignore

# script to make nvim default for editor and visual globals
# dot="."
# foo=`ps h -p $$ -o args=''`
# ed=${foo:0:3}
# rc="rc"
# rcfile=$dot$ed$rc

# npm i -g eslint jscs elm
