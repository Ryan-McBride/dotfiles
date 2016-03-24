#!/bin/bash
for entry in `ls .backup`; do
  newest=$entry
done

cp .backup/$newest/bash_profile ./bash_profile 
cp .backup/$newest/init.vim ./init.vim 
cp .backup/$newest/aliases ./aliases 

echo 'The newest backup has been restored. Please run setfiles to impliment these dotfiles'

