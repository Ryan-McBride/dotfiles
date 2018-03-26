#!/bin/bash
for entry in `ls .backup`; do
  newest=$entry
done

cp .backup/$newest/bash_profile ./bash_profile 
cp .backup/$newest/vimrc ./vimrc 
cp .backup/$newest/aliases ./aliases 
cp .bachup/$newest/bash_prompt ./bash_prompt

echo 'The newest backup has been restored. Please run setfiles to impliment these dotfiles'

