# Security issue
set nomodeline
set ignorecase
set smartcase
set hlsearch

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
Plug 'powerline/powerline'
call plug#end()

filetype plugin on
set wildmode=longest:full,full
set splitbelow splitright
set number relativenumber

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

vnoremap <C-c> "*y :let @+=@*<CR>

