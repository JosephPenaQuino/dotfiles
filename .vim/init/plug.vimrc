" $HOME/.vim/init/plug.vimrc

" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rhysd/vim-clang-format'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-system-copy'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'neoclide/coc.nvim', {'for':['zig','cmake','rust',
      \'java','json', 'haskell', 'ts','sh', 'cs',
      \'yaml', 'c', 'cpp', 'd', 'go',
      \'python', 'dart', 'javascript', 'vim'], 'branch': 'release'}
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'arcticicestudio/nord-vim'
Plugin 'iamcco/diagnostic-languageserver'
Plugin 'github/copilot.vim'
Plugin 'szw/vim-maximizer'
Plugin 'puremourning/vimspector'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call vundle#end()            
