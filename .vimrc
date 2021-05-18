set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'rhysd/vim-clang-format'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vimwiki/vimwiki'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'rdnetto/YCM-Generator'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-system-copy'
Plugin 'SirVer/ultisnips'
Plugin 'wakatime/vim-wakatime'
call vundle#end()            

" DiffSaved
function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Ctags
set tags=./tags;,tags;

" Show tabs
set list
set list listchars=tab:\|\-

" Share vim clipboard
vmap <leader>y :w! /tmp/vitmp<CR>
vmap <leader>x :w! /tmp/vitmp<CR> gv x
nmap <leader>p :r! cat /tmp/vitmp<CR>
map <F2> :echo 'Current time is ' . strftime('%c')<CR>


"Settings
set showmode
syntax on

"============================================================
" YouCompleteMe settings
"============================================================
" Mapping to close the completion menu (default <C-y>)
let g:ycm_key_list_stop_completion = ['<C-x>']

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_always_populate_location_list = 1      " Always populae diagnostics list
let g:ycm_enable_diagnostic_signs = 1            " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1          " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20                " Max number of completion suggestions 
let g:ycm_max_num_identifier_candidates = 10     " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                       " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                 " Show diagnostic display features
let g:ycm_error_symbol = '>>'                    " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1            " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1     " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1            " Echo line's diagnostic that cursor is on

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0                 " Don't ask to confirm .ycm_extra_conf
let g:ycm_use_ultisnips_completer = 1
"============================================================

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction

" Vim-airline
"let g:airline_section_c = '%F'
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop = 1

" Show the name of the function
fun! ShowFuncName()
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))
  echohl None
endfun
map F :call ShowFuncName() <CR>

set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set noexpandtab
set number
set relativenumber
set statusline +=%F

" Colortheme
colorscheme dracula

" Color typedefs, unions and structs
match Type "\h\w*_t\w\@!"
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"

" clang 
let g:clang_detect_style_file = 1
let g:clang_format#auto_format = 1

