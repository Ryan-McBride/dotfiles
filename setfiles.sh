#!bin/bash
TIMESTAMP=`date +%Y-%m-%d-%s`
DIRECTORY='.backup/'$TIMESTAMP
mkdir -p $DIRECTORY
cp $HOME/.settings $DIRECTORY'/settings'
cp $HOME/.aliases $DIRECTORY'/aliases'
cp $HOME/.vimrc $DIRECTORY'/vimrc'

grep -lr dotfilesinclude $HOME/.bash_profile || cat ./include_text >> $HOME/.bash_profile
cp ./aliases $HOME/.aliases
cp ./vimrc $HOME/.vimrc
cp ./settings $HOME/.settings

echo 'The systemfiles have been updated from the files in this directory'
