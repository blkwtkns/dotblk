# Shell scripts 

#Ensure that script is being run in home directory
cd $HOME

#Create variable to find path to script 
dotDir=$(dirname "$(readlink -f "$0")")
# echo $dotDir

# symlinks
ln -sv $dotDir/nvim $HOME/.config
ln -sv $dotDir/.eslintrc
ln -sv $dotDir/.gitconfig
ln -sv $dotDir/.jscsrc
ln -sv $dotDir/.tmux.conf
ln -sv $dotDir/jsdev.conf $HOME/.tmux/jsdev.conf
ln -sf $dotDir/.zpreztorc $HOME/.zpreztorc
ln -sf $dotDir/.zprofile $HOME/.zprofile

# script to make nvim default for editor and visual globals
dot="."
ed=`ps h -p $$ -o args='' | cut -f1 -d ' '`
rc="rc"
rcfile=$dot$ed$rc

echo "export EDITOR='$(which nvim)'" >> $HOME/$rcfile
echo "export VISUAL='$(which nvim)'" >> $HOME/$rcfile
