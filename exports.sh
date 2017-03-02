#!/bin/bash

# script to make nvim default for editor and visual globals
dot="."
foo=`ps h -p $$ -o args=''`
ed=${foo:0:3}
rc="rc"
rcfile=$dot$ed$rc

echo "export EDITOR='$(which vim)'" >> $HOME/$rcfile
echo "export VISUAL='$(which vim)'" >> $HOME/$rcfile
