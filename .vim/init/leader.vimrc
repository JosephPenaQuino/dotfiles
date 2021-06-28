" $HOME/.vim/init/leader.vimrc

" Share vim clipboard
vmap <leader>y :w! /tmp/vitmp<CR>
vmap <leader>x :w! /tmp/vitmp<CR> gv x
nmap <leader>p :r! cat /tmp/vitmp<CR>

" Change between vim buffer
nmap <leader>n :bn<CR>
nmap <leader>N :bN<CR>

" Insert a new line
nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
