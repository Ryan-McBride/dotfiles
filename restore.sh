#!/bin/bash
for entry in `ls .backup`; do
  newest=$entry
done

cp .backup/$newest/settings ./settings 
cp .backup/$newest/vimrc ./vimrc 
cp .backup/$newest/aliases ./aliases 

echo 'The newest backup has been restored. Please run setfiles to impliment these dotfiles'

