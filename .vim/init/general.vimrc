" $HOME/.vim/init/general.vimrc

set nocompatible              " be iMproved, required
filetype off                  " required
set showmode
syntax on

" Ctags
set tags=./tags;,tags;

" Tabs
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Numbers
set number
set relativenumber

set statusline +=%F

" Colortheme
colorscheme dracula

" Color typedefs, unions and structs
match Type "\h\w*_t\w\@!"
