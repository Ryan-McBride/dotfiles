set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rafi/awesome-vim-colorschemes'
call vundle#end()
filetype plugin indent on

set ruler
set smartindent
set smartcase
set number
set showmatch
set mat=3
set guifont=Hack
set hls
syntax on
colorscheme dracula

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ignorecase
set backspace=2
runtime macros/matchit.vim

let mapleader = " "

let g:ale_linters = {
\ 'javascript': ['eslint'],
\}
let g:airline_theme='vice'
