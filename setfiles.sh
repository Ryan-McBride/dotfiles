#!bin/bash
TIMESTAMP=`date +%Y-%m-%d-%s`
DIRECTORY='.backup/'$TIMESTAMP
mkdir -p $DIRECTORY
cp ~/.bash_profile $DIRECTORY'/bash_profile'
cp ~/.aliases $DIRECTORY'/aliases'
cp ~/.vimrc $DIRECTORY'/vimrc'
cp ~/.bash_prompt $DIRECTORY'/bash_prompt'

cp ./bash_profile ~/.bash_profile
cp ./aliases ~/.aliases
cp ./vimrc ~/.vimrc
cp ./bash_prompt ~/.bash_prompt

echo 'The systemfiles have been updated from the files in this directory'
