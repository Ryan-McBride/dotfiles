#!bin/bash
TIMESTAMP=`date +%Y-%m-%d-%s`
DIRECTORY='.backup/'$TIMESTAMP
mkdir -p $DIRECTORY
cp ~/.bash_profile $DIRECTORY'/bash_profile'
cp ~/.aliases $DIRECTORY'/aliases'
cp ~/.config/nvim/init.vim $DIRECTORY'/init.vim'

cp ./bash_profile ~/.bash_profile
cp ./aliases ~/.aliases
cp ./init.vim ~/.config/nvim/init.vim

echo 'The systemfiles have been updated from the files in this directory'
