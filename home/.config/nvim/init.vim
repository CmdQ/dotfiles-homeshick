set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if executable("rg")
    set grepprg=rg\ --vimgrep
endif

clipboard+=unnamedplus
