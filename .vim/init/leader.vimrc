" $HOME/.vim/init/leader.vimrc

" Share vim clipboard
" vmap <leader>y :w! /tmp/vitmp<CR>
" vmap <leader>x :w! /tmp/vitmp<CR> gv x
" nmap <leader>p :r! cat /tmp/vitmp<CR>

" Change between vim buffer
nmap <leader>n :bn<CR>
nmap <leader>N :bN<CR>

" Insert a new line
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

nmap <space>t :g/UT_CASE(/#<CR>

