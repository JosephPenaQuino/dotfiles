set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
source ~/.config/nvim/only-lua.vim

lua <<EOF
 print("Hello, my lord!")
EOF
