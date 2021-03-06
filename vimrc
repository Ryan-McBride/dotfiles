set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'simeji/winresizer'
Plugin 'SirVer/ultisnips'
Plugin 'leafgarland/typescript-vim'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'vim-scripts/Greplace.vim'
Plugin 'alvan/vim-closetag'
Plugin 'dracula/vim', { 'name': 'dracula' }
call vundle#end()
filetype plugin indent on

set ttimeout
set ttimeoutlen=100
set ruler
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

au BufNewFile,BufRead *.ejs set filetype=html

"arrowkeys
inoremap ∆ <Down>
vnoremap ∆ <Down>
nnoremap ∆ <Down>
inoremap ˚ <Up>
vnoremap ˚ <Up>
nnoremap ˚ <Up>
inoremap ¬ <Right>
vnoremap ¬ <Right>
nnoremap ¬ <Right>
inoremap ˙ <Left>
vnoremap ˙ <Left>
nnoremap ˙ <Left>

"semicolon magic
nnoremap … <Esc>A;<Esc>
vnoremap … <Esc>A;<Esc>
inoremap … <Esc>A;<Esc>

let mapleader = " "

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :w <bar> Fixmyjs<CR>

iabbrev </ </<C-X><C-O>

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint', 'stylelint'],
\ 'scss': ['sass-lint'],
\}
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='dracula'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:NERDSpaceDelims = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
