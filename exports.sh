#!/bin/bash

# script to make nvim default for editor and visual globals
dot="."
ed=`ps h -p $$ -o args='' | cut -f1 -d ' '`
rc="rc"
rcfile=$dot$ed$rc

echo "export EDITOR='$(which nvim)'" >> $HOME/$rcfile
echo "export VISUAL='$(which nvim)'" >> $HOME/$rcfile
