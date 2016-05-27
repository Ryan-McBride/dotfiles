"Vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

"Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'leafgarland/typescript-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'

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
nmap s :w<CR>
nmap qq :q<CR>
nmap Q :q!<CR>
nmap <silent> <Leader>t :NERDTreeTabsToggle <CR>
nmap <F2> <Esc>:%s/

imap <F3>c console.log('')<Left><Left>
xnoremap <F3>c cconsole.log()<Esc>P
imap <F3>f function(){}<Left><CR><CR><Up><Tab>

"semicolon magic
inoremap <F4> <Esc>A;<Esc>
nnoremap <F4> A;<Esc>
vnoremap <F4> <Esc>A;<Esc>

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

  "emmet
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,js,ts EmmetInstall

  "multiple-cursors
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'
