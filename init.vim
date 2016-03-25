"Vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

"Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'

"End Vundle Plugins
call vundle#end()
filetype plugin indent on

"pathogen
execute pathogen#infect()
filetype plugin on

"general
set autoread

"UI
set ruler
set ignorecase
set number
set showmatch
set mat=3
set guifont=Hack

"pretty stuff
syntax on
set background=dark
set encoding=utf8
colorscheme molokai
let g:molokai_original = 1

"backup
set nobackup
set nowb
set noswapfile

"text stuff
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

"remaps
nmap s :w <CR>
nmap qq :q <CR>
nmap tt :NERDTreeTabsToggle <CR>
nmap <F2> <Esc>:%s/

inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "<Right>" : ")" 
inoremap [ []<Left>
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "<Right>" : "]" 
inoremap { {}<Left>
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "<Right>" : "}" 

imap <F3>c console.log('')<Left><Left>
imap <F3>f function(){}<Left><CR><CR><Up><Tab>

xnoremap <F3>c cconsole.log()<Esc>P

" Quickly edit / reload .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"plugins:

  "syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_html_tidy_ignore_errors=[" lacks \"action\" attribute"]
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  "airline
  set laststatus=2
  let g:airline#extensions#branch#enabled = 1
  let g:airline_powerline_fonts = 1 
