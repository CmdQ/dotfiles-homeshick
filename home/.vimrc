" Security issue
set nomodeline
set ignorecase
set smartcase
set hlsearch
set clipboard=unnamedplus

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

if has("nvim")
    call plug#begin()
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-speeddating'
    Plug 'haya14busa/incsearch.vim'
    Plug 'vim-airline/vim-airline'
    call plug#end()
endif

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

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 1
