# Just plain ol' source control for my dotfiles so that I can get my DE up and running as quick as possible.

## Installation:
  Just clone this and cd into it.
  
## Files affected:
  ```
  ~/.bash_profiles
  ~/.aliases
  ~/.vimrc
  ~/.bash_prompt
  ```
  
## Commands:
  * `bash setfiles.sh` locally backs up dotfiles, replaces system dotfiles with ones in repo directory
  * `bash restore.sh` replaces system dotfiles with most recent backup. Basically an undo. Replacing dotfiles with older ones must be done manually
  * `bash getfiles.sh` replaces local dotfiles with system dotfiles to be committed to source control
