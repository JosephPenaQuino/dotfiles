" $HOME/.vim/init/general.vimrc

set nocompatible              " be iMproved, required
filetype off                  " required
set showmode
syntax on
set incsearch
set colorcolumn=80
set tw=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Ctags
set tags=./tags;,tags;

" Tabs
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set noexpandtab
set list listchars=tab:\|\-

" undo files
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Numbers
set number
set relativenumber

set statusline +=%F

" Colortheme
colorscheme dracula

" Color typedefs, unions and structs
match Type "\h\w*_t\w\@!"
set wrap linebreak

autocmd BufRead *.py set expandtab
