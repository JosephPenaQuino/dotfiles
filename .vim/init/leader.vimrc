" $HOME/.vim/init/leader.vimrc

" Share vim clipboard
vmap <leader>y :w! /tmp/vitmp<CR>
vmap <leader>x :w! /tmp/vitmp<CR> gv x
nmap <leader>p :r! cat /tmp/vitmp<CR>

